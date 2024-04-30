# TUNISAIR BI PROJECT

# Software & Requirements

- Docker : Container For Oracle DB
- Dbeaver SQL Client
- Node.js (20)
- React
- Vite
- Python
- Django
- Swagger
- Postman

# Create an Oracle Container (Docker)

- Pull Oracle Image

```bash
docker pull container-registry.oracle.com/database/express:latest
```
- Create a container

```bash
docker container create -it --name oracle-test -p 1521:1521 -e ORACLE_PWD=welcome123 container-registry.oracle.com/database/express:latest
```

### Make sure to install node

npm install -g yarn


# Create The Front-End Dashboard :

```bash
yarn create react-admin tunisair-bi-app
```

# To install dependancies :

```bash
yarn
```

# To run the react app :

```bash 
yarn dev
```


