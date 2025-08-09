DOCKER_REGISTRY ?= ghcr.io/jr200
IMAGE_NAME ?= bento-custom-image

build:
	podman build \
	    --layers \
		-f docker/Dockerfile \
		-t ghcr.io/jr200/bento-custom-image:local \
		.

run:
	docker run --rm ghcr.io/jr200/bento-custom-image:local

shell:
	docker run --rm -it --entrypoint /bin/sh ghcr.io/jr200/bento-custom-image:local

