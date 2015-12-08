DOCKER_IMAGE_NAME=almir/glassfish
GLASSFISH_VERSION=4.1.1
JDK_VERSION=8

build: Dockerfile
ifeq ($(JDK_VERSION),8)
	docker build --force-rm=true --tag=$(DOCKER_IMAGE_NAME):4.1-jdk$(JDK_VERSION) . && \
	docker tag -f $(DOCKER_IMAGE_NAME):4.1-jdk$(JDK_VERSION) $(DOCKER_IMAGE_NAME):latest
else
	docker build --force-rm=true --file="Dockerfile-jdk$(JDK_VERSION)" --tag=$(DOCKER_IMAGE_NAME):4.1-jdk$(JDK_VERSION) .
endif
