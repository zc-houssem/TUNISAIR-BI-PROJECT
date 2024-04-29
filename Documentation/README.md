# TUNISAIR BI PROJECT

# Software & Requirements

- Docker
- Dbeaver SQL Client
- Node.js
- React
- Vite
- Python
- Django
- Swagger

# Create an Oracle Container (Docker)

- Pull Oracle Image

```bash
docker pull container-registry.oracle.com/database/express:latest
```
- Create a container

```bash
docker container create -it --name oracle-test -p 1521:1521 -e ORACLE_PWD=welcome123 container-registry.oracle.com/database/express:latest
```

# Create Front-End Dashboard

```bash
yarn create react-admin test-admin
```
