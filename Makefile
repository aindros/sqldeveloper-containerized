include config.mk

all: Dockerfile
	${DOCKER} build -t ${IMAGENAME} .

Dockerfile: scripts/build-dockerfile.sh
	@scripts/build-dockerfile.sh
	@echo $@ written

clean:
	@rm -f Dockerfile

run:
	[ ! -d "${CONFIG}" ] && mkdir -p ${CONFIG}
	${DOCKER} run -it \
		-v ${CONFIG}:/root \
		-v ${XAUTHORITY}:${XAUTHORITY}:ro \
		-v ${XSOCK}:${XSOCK}:ro \
		-e "DISPLAY" \
		--security-opt label=type:container_runtime_t ${IMAGENAME}

