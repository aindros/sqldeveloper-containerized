# SQL Developer Containerized

To create just the Dockerfile, execute:
`$ make Dockerfile`

To build a new image, just do:
`$ make`

To execute the container:
`$ make run`

That command executes:
```
podman run -it --rm \
	-v ~/.sqldeveloper-conf:/root \
	-v $XAUTHORITY:$XAUTHORITY:ro \
	-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-e "DISPLAY" \
	--security-opt label=type:container_runtime_t sqldeveloper
```

