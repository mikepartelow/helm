.PHONY: build list install uninstall

kube-config:
	kind get kubeconfig --name fun-with-helm | sed 's/127.0.0.1/host.docker.internal/g' > kube-config

build: kube-config
	docker build -t khelm .

DOCKER_RUN := docker run --rm -ti khelm

CMD_GLOBAL_FLAGS := --kube-context kind-fun-with-helm --kube-insecure-skip-tls-verify
CMD_LIST := $(CMD_GLOBAL_FLAGS) list -A
CMD_INSTALL := $(CMD_GLOBAL_FLAGS) install nginx bitnami/nginx -n helm
CMD_UNINSTALL := $(CMD_GLOBAL_FLAGS) uninstall nginx -n helm

list: build
	@$(DOCKER_RUN) $(CMD_LIST)

install: build
	@$(DOCKER_RUN) $(CMD_INSTALL)

uninstall: build
	@$(DOCKER_RUN) $(CMD_UNINSTALL)
