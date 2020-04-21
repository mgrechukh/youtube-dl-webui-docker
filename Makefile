export DOCKER_BUILDKIT=1

IMAGE_NAME=youtube-dl-webui
TAG=latest

image: Dockerfile
	docker build -t $(IMAGE_NAME):$(TAG) . --progress plain

test: image
	docker run -it --rm $(IMAGE_NAME):$(TAG)
