**Arcane-Term**

Arcane-Term is a powerful web-based terminal application designed for interactive and containerized Linux lab environments.

**Installation**

Ensure you have Node.js installed on your machine. Use the following command to install the required dependencies:

```sh
git clone https://github.com/MaverickArcane/Arcane-Term
cd Arcane-Term
npm i
```

**Running the Application**

To start the Arcane-Term application, execute the following command:
```sh
npm start
```
This command uses `concurrently` to run both the WebSocket server (`socket.js`) and the frontend terminal (`app.js`) concurrently.

**Running WebSocket Only**

To run only the WebSocket server, use the following command:

```sh
npm run socket
```

*For example, use with [Tome](https://github.com/MaverickArcane/Tome).*

**Running Frontend Only**

For debugging purposes, run only the frontend terminal with:
```sh
npm run frontend
```

**Note**: If you choose to run Arcane-Term on your host machine, it will spawn a shell on your local machine for the frontend. If you prefer a containerized version with a template Linux lab, follow the instructions below.

**Containerized Version**

To use the containerized version with a template Linux lab included, build and run your own terminal with the provided Dockerfile. Ensure you have Docker installed on your machine.

**Build the Docker Image**
```sh
docker build -t your-terminal-image-name .
```
Feel free to customize the Dockerfile's entrypoint based on your specific requirements. The default is:
```md
ENTRYPOINT ["npm", "start"]
```

Then run the docker container:

```sh
docker run -p 6060:6060 -p 8080:8080 your-terminal-image-name
```


Now, you're ready to explore and use Arcane-Term in your web browser of choice at http://localhost:8080