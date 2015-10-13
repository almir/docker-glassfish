DOCKER_IMAGE_NAME=almir/glassfish

build: Dockerfile
	docker build --force-rm=true --tag=${DOCKER_IMAGE_NAME} .
