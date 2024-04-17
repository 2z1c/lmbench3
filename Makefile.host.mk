
DOCKER_IMAGE := build_lmbench3_arm64_v1
export DOCKER_IMAGE

.PHONY: build
build_docker:
	docker buildx build -f docker/Dockerfile.ubuntu2204 --platform=linux/arm64 -t ${DOCKER_IMAGE} --load . 

build_binary:
	-docker run --rm -v ${CURDIR}:${CURDIR} -w ${CURDIR} ${DOCKER_IMAGE} make build
	file ${CURDIR}/bin/*


local_run_docker:
	docker run --rm -it -v ${CURDIR}:${CURDIR} -w ${CURDIR} ${DOCKER_IMAGE} /bin/bash