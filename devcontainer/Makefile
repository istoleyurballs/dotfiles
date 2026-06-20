DOCKER=podman

.PHONY: build
build: Dockerfile
	$(DOCKER) pull docker.io/archlinux:base-devel
	$(DOCKER) build -t devcontainer .
