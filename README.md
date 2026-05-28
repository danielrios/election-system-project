# Election System Project

This repository contains a multi-service election system built with Quarkus. It includes three
Java services and supporting infrastructure for data storage, caching, and observability.

## Services

- **election-management**: Election management API (Quarkus, Java 17)
- **voting-app**: Voting API (Quarkus, Java 17)
- **result-app**: Results API/UI (Quarkus, Java 17)

Supporting infrastructure in `docker-compose.yml`:

- **reverse-proxy**: Traefik (routes traffic by host/path)
- **database**: MariaDB
- **caching**: Redis
- **logging**: Graylog + OpenSearch + MongoDB
- **telemetry**: Jaeger

## Prerequisites

- Docker + Docker Compose
- Java 17 (for local development outside Docker)

## Run with Docker Compose

1. Add local hostnames:

   ```bash
   sudo sh -c 'echo "127.0.0.1 vote.dio.localhost logging.private.dio.localhost telemetry.private.dio.localhost" >> /etc/hosts'
   ```

2. Start the stack:

   ```bash
   docker compose up --build
   ```

3. Access the services:

   - Election management API: `http://vote.dio.localhost/api`
   - Voting API: `http://vote.dio.localhost/api/voting`
   - Result app: `http://vote.dio.localhost/`
   - Traefik dashboard: `http://localhost:8080`
   - Graylog UI: `http://logging.private.dio.localhost`
   - Jaeger UI: `http://telemetry.private.dio.localhost`

> Note: Authentication for Graylog and Jaeger is configured in `docker-compose.yml`.

## Local development

Each service includes its own README with Quarkus dev instructions:

- `election-management/README.md`
- `voting-app/README.md`
- `result-app/README.md`

Example (from a service directory):

```bash
./mvnw compile quarkus:dev
```

## CI/CD scripts

These scripts are available at the repo root:

- `cicd-build.sh <service>`: Builds the service, bumps the version, and builds the Docker image.
- `cicd-blue-green-deployment.sh <service> <tag>`: Blue/green deployment using Docker Compose.
