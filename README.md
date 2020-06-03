# Geocent DevOps Code Challenge

## The Challenge

#### Part 1
The development teams on your project have been working on a set of microservices. They need your help to "Dockerize" their microservices, datastores, and dependent services. Your goal is to provide each microservice with working Dockerfile(s) and Docker-compose file(s) to deploy the suite of services locally for testing. If all services are configured correctly the `webapp` should look like the image below when rendered.

#### Part 2
In addition, the team would like to use Kubernetes to deploy these services in continuous integration and production environments. Because `Docker for Mac` and `Docker for Windows` provides Kubernetes out-of-the-box, the team would like to be able to test their services locally in Kubernetes before progressing to CI pipelines. Your goal is to prepare Kubernetes configuration in order to deploy the services in a local Kubernetes cluster. If all services are configured correctly the `webapp` should look like the image below when rendered.

![Ideal Scenario image](./ideal-scenario.png)

## Pre-Requisites
- `docker-for-mac` or `docker-for-windows`
	- Includes `docker`, `docker-compose`, `kubectl`, and `kubernetes`

## Provided Architecture
<pre>																			  
                                   counter-service --> redis												
                                  /
Web Browser Client --> nginx-proxy ---- webapp
                                  \
                                   person-service --> postgres
</pre>

## Service Details
- `postgres` - Postgres database used by the `person-service`
	- Base Docker hub image tag: `postgres:11`
	- Exposed port: `5432`
- `redis` - Redis key-value datastore used by the `counter-service`
	- Base Docker hub image tag: `redis:alpine`
	- Exposed port: `6379`
- `person-service` - A spring-boot/Java backend microservice that provides `persons` REST endpoints
	- Base Docker hub image tags: `gradle:5.4-jdk11` and `openjdk:11.0-jdk` (Use multi-stage Dockerfiles)
	- Exposed port: `8080`
- `counter-service` - A Flask/Python backend microservice that provides a `counter` REST endpoint
	- Base Docker hub image tag: `python:3.7`
	- Exposed port: `5000`
- `webapp` - React SPA frontend that consumes the `person-service` and `counter-service`
	- Base Docker hub image tags: `node:12-alpine` and `nginx:1.14.2` (Use multi-stage Dockerfiles)
	- Exposed port: `3000` and/or `80`
- `nginx-proxy` - Proxies to `webapp`, `counter-service`, and `person-service` - Route and proxy all service endpoints through Nginx as a service that is accessible to the host
	- Base Docker hub image tag: `nginx:1.14.2`
	- Exposed port in docker-compose: `8000` and/or `80`
	- Exposed port in Kubernetes: `30500` (Use `NodePort` in the service)

## Part 1 - More Information and Requirements
- Use `docker` - create `Dockerfiles` for each service that needs one.
- Use `docker-compose` stack(s) to network all services according to the architecture above.
- A starter `docker-compose.yml` has been provided with the `postgres` and `redis` services configured. Add the rest of the services to the stack.
- The `.env-dev` has been provided with the necessary environment variables that will be needed by the services.
- The `pull-required-images.sh` script has been provided as a convenience to pull all of the required docker images for this code challenge.

## Part 2 - More Information and Requirements
- Utilize your work from part 1 - i.e. the `Dockerfiles` you prepared.
- Use `kubernetes`
	- You may use `Docker for Mac` Kubernetes, `Docker for Windows` Kubernetes, or `minikube`
	- For deployment tools, you may use `vanilla Kubernetes yaml`, `Helm`, `Kustomize`, or any other tool/scripting that you are comfortable with.
