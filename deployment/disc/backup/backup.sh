#!/bin/bash
#We keep recent 10 days files
set -e
now=$(date +"%s_%Y-%m-%d")
user="root"
pwd="root"



#openhim
backupPath="/opt/data/rhies/rhies_deployment/disc/openhim/backup/"

echo "Openhim, backup started ..."
echo "Openhimn, removing old backups files ..."
zipfolderName="${backupPath}openhim_${now}/" 
mkdir -p  ${zipfolderName} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "Openhim, exporting database ..."
mongodump --host 127.0.0.1 -d openhim --port 27018 --out ${zipfolderName}
wait 
cd ${backupPath} 
echo "Openhim, zipping export folder ..."
zip -r ./openhim_${now}.zip ./openhim_${now}
rm -R ./openhim_${now}
echo "Openhimn, done ..."








#1 OpenMRS
sitename="siteName1"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 1, backup started ..."
host="127.0.0.1"
port="3307"
db="openmrs"
echo "OpenMRS 1, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 1, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 1, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 1, done ..."





#2 OpenMRS
sitename="bethsaida-hc-29"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 2, backup started ..."
host="127.0.0.1"
port="3308"
db="openmrs"
echo "OpenMRS 2, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 2, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 2, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 2, done ..."



#3 OpenMRS
sitename="kabusunzu-hc-6"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 3, backup started ..."
host="127.0.0.1"
port="3309"
db="openmrs"
echo "OpenMRS 3, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 3, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 3, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 3, done ..."




#4 OpenMRS
sitename="corunum-hc-4"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 4, backup started ..."
host="127.0.0.1"
port="3310"
db="openmrs"
echo "OpenMRS 4, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 4, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 4, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 4, done ..."



#5 OpenMRS
sitename="rugarama-hc-11"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 5, backup started ..."
host="127.0.0.1"
port="3311"
db="openmrs"
echo "OpenMRS 5, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 5, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 5, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 5, done ..."



#6 OpenMRS
sitename="muhima-hc-7"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 6, backup started ..."
host="127.0.0.1"
port="3312"
db="openmrs"
echo "OpenMRS 6, removing old backups files ..."
mkdir -p  ${backupPath} 
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 6, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql 
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath} 
echo "OpenMRS 6, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait 
rm ${fileName}
echo "OpenMRS 6, done ..." 

#7 OpenMRS
sitename="we-act-1237"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 6, backup started ..."
host="127.0.0.1"
port="3317"
db="openmrs"
echo "OpenMRS 7, removing old backups files ..."
mkdir -p  ${backupPath}
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 7, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath}
echo "OpenMRS 7, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait
rm ${fileName}
echo "OpenMRS 7, done ..."


#8 OpenMRS
sitename="clinique-carrefour-657"
backupPath="/opt/data/rhies/rhies_deployment/disc/openmrs/backup/${sitename}/"

echo "OpenMRS 8, backup started ..."
host="127.0.0.1"
port="3318"
db="openmrs"
echo "OpenMRS 8, removing old backups files ..."
mkdir -p  ${backupPath}
find ${backupPath}  -name "*.zip" -type f -mtime +10 -exec rm -f {} \;
echo "OpenMRS 8, exporting database ..."
fileName=${backupPath}mysql_${sitename}_${now}.sql
/usr/bin/mysqldump --opt -h ${host}  -P ${port} -u ${user}  -p${pwd}  ${db} > ${fileName}
wait
cd ${backupPath}
echo "OpenMRS 8, zipping export folder ..."
zip  mysql_${sitename}_${now}.zip  mysql_${sitename}_${now}.sql
wait
rm ${fileName}
echo "OpenMRS 8, done ..."
