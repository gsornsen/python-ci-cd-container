SHELL:=/bin/bash

CONTAINERNAME=python-ci-cd-container
CONTAINERVERSION=latest
# This command assumes the newest container is the top grep match
CONTAINER_ID=`docker image ls | grep -m 1 ${CONTAINERNAME} | awk -F '  +' '{print $$3}'`


.PHONY: docker_build docker_up docker_down docker_shell

docker_build:
	@echo "Building Docker Image: ${CONTAINERNAME}"
	docker build \
		--tag ${CONTAINERNAME}:${CONTAINERVERSION} .

.PHONY: docker_up
docker_up:
	@echo "Starting Docker container: ${CONTAINERNAME}"
	docker run -d --name ${CONTAINERNAME} \
		--rm ${CONTAINERNAME}:${CONTAINERVERSION}

.PHONY: docker_down
docker_down:
	@echo "Stopping Docker container: ${CONTAINERNAME}"
	docker stop ${CONTAINERNAME}

.PHONY: docker_shell
docker_shell:
	@echo "Opening debug shell to: ${CONTAINERNAME}"
	docker exec -it ${CONTAINERNAME} /bin/bash

