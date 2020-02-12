#!/usr/bin/env node
'use strict'

const express = require('express')
const request = require('request')
const medUtils = require('openhim-mediator-utils')
const winston = require('winston')

const utils = require('./utils')

// Logging setup
winston.remove(winston.transports.Console)
winston.add(winston.transports.Console, { level: 'info', timestamp: true, colorize: true })

// Config
var config = {} // this will vary depending on whats set in openhim-core
const apiConf = process.env.NODE_ENV === 'test' ? require('../config/test') : require('../config/config')
const mediatorConfig = require('../config/mediator')

var port = process.env.NODE_ENV === 'test' ? 7001 : mediatorConfig.endpoints[0].port

/**
 * setupApp - configures the http server for this mediator
 *
 * @return {express.App}  the configured http server
 */
function setupApp() {
  const app = express()
  app.all('*', (req, res) => {
    winston.info(`Processing ${req.method} request on ${req.url}`)

    var options = {
      url: 'http://10.3.217.40:9090/openmrs/ws/rest/v1/patient/5b723cb5-b28e-4c7d-bd12-d9ce38161577',
      headers: {
        'Authorization': 'Basic ' + new Buffer("admin" + ":" + "Umurwayi5!").toString('base64'),
        'Content-Type': 'application/json'
      }
    };

    request.get(options, function (error, res, body) {
      if (error) {
      //  console.log(res.body);
        reportEndOfProcess(req, res, '', 500, 'we got an error' + error);
      } else {
/*         var sendingOptions = {
          url: '',
          headers: {
            'Authorization': 'Basic ' + new Buffer("" + ":" + "").toString('base64'),
            'Content-Type': 'application/json'
          }
        };
        request.get(sendingOptions, function (error, res, body) {
          if (error) {
            console.log(res.body);
            reportEndOfProcess(req, res, '', 500, 'we got an error while sending' + error);
          } else {
            console.log(res.body);
            reportEndOfProcess(req, res, '', 200, 'data sent success');
          }
        }); */

        //console.log(res.body);
        reportEndOfProcess(req, res, '', 200, 'data sent success');
      }
    });
  })
  return app
}

function reportEndOfProcess(req, res, error, statusCode, message) {
  res.set('Content-Type', 'application/json+openhim')
  var responseBody = message;
  var stateLabel = "";
  let orchestrations = [];

  var headers = { 'content-type': 'application/json' }
  if (error) {
    stateLabel = "Failed";
    winston.error(message, error);
  } else {
    stateLabel = "Successful";
    winston.info(message);
  }
  var orchestrationResponse = { statusCode: statusCode, headers: headers }
  orchestrations.push(utils.buildOrchestration('Primary Route', new Date().getTime(), req.method, req.url, req.headers, req.body, orchestrationResponse, responseBody))
  res.send(utils.buildReturnObject(mediatorConfig.urn, stateLabel, statusCode, headers, responseBody, orchestrations, { property: 'Primary Route' }));
}




/**
 * start - starts the mediator
 *
 * @param  {Function} callback a node style callback that is called once the
 * server is started
 */
function start(callback) {
  if (apiConf.api.trustSelfSigned) { process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0' }

  if (false) {
    //if (apiConf.register) {
    medUtils.registerMediator(apiConf.api, mediatorConfig, (err) => {
      if (err) {
        winston.error('Failed to register this mediator, check your config')
        winston.error(err.stack)
        process.exit(1)
      }
      apiConf.api.urn = mediatorConfig.urn
      medUtils.fetchConfig(apiConf.api, (err, newConfig) => {
        winston.info('Received initial config:')
        winston.info(JSON.stringify(newConfig))
        config = newConfig
        if (err) {
          winston.error('Failed to fetch initial config')
          winston.error(err.stack)
          process.exit(1)
        } else {
          winston.info('Successfully registered mediator!')
          let app = setupApp()
          const server = app.listen(port, () => {
            if (apiConf.heartbeat) {
              let configEmitter = medUtils.activateHeartbeat(apiConf.api)
              configEmitter.on('config', (newConfig) => {
                winston.info('Received updated config:')
                winston.info(JSON.stringify(newConfig))
                // set new config for mediator
                config = newConfig

                // we can act on the new config received from the OpenHIM here
                winston.info(config)
              })
            }
            callback(server)
          })
        }
      })
    })
  } else {
    // default to config from mediator registration
    config = mediatorConfig.config
    let app = setupApp()
    const server = app.listen(port, () => callback(server))
  }
}
exports.start = start

if (!module.parent) {
  // if this script is run directly, start the server
  start(() => winston.info(`Listening on ${port}...`))
}
