
DOCKER_IMAGE := build_lmbench3_arm64_v1

build_docker:
	docker buildx build -f docker/Dockerfile.ubuntu2204 --platform=linux/arm64 -t ${DOCKER_IMAGE} . 
