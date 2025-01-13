APP_NAME = server-k8s
DOCKER_USERNAME = jaycynth
TAG = v0.1

.PHONY: all
all: build tag push

.PHONY: build
build:
	docker build -t $(APP_NAME) .

.PHONY: tag
tag:
	docker tag $(APP_NAME) $(DOCKER_USERNAME)/$(APP_NAME):$(TAG)

.PHONY: push
push:
	docker push $(DOCKER_USERNAME)/$(APP_NAME):$(TAG)

.PHONY: clean
clean:
	docker rmi -f $(APP_NAME) $(DOCKER_USERNAME)/$(APP_NAME):$(TAG)

.PHONY: help
help:
	@echo "Makefile Usage:"
	@echo "  make build    - Build the Docker image"
	@echo "  make tag      - Tag the Docker image"
	@echo "  make push     - Push the Docker image to Docker Hub"
	@echo "  make clean    - Remove the Docker images"
	@echo "  make help     - Display this help message"
