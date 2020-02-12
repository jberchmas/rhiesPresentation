## mediator ##

### Prerequisites ###
* Netbeans or VS code or any editor you prefere



* Follow the steps to modify the omrstonida mediator

1. Open the **server** folder inside your ide

2. edit the **lib/index.js** file

3. push your modifications to bitbucket

4. Before building the image, delete the **node_modules** folder

5. Build the docker image by running the command  **docker build -t  savicsorg/myMediator:latest .**  while in the docker folder, the **latest** flag is the version number

6. Push your image to the docker hub by running the command **docker push savicsorg/myMediator:latest** ,the **latest** flag is the version number
