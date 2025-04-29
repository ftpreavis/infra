# Transcendance's Infrastructure

## Content

- docker-compose.dev.yml : Starts all the microservices in development env
- docker-compose.ytml : Starts all the microservices in production env
- InitMicro.Dockerfile : Builds a new microservice (Use with ft_preavis meta repository's new-micro Makefile rule)

Prod docker-compose.yml also starts an nginx server to serve the different services
