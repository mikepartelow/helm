# khelm

Demo of a containerized helm wrapper for managing a local [kind](https://kind.sigs.k8s.io) cluster.

## Setup

[Install kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation) and create a cluster named `fun-with-helm`.

```bash
% kind create fun-with-helm
```

## Usage
```bash
% make list
NAME	NAMESPACE	REVISION	UPDATED	STATUS	CHART	APP VERSION
% make install
NAME: nginx
LAST DEPLOYED: Sun Mar 17 17:19:37 2024
NAMESPACE: helm
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: nginx
CHART VERSION: 15.14.0
APP VERSION: 1.25.4
...
% make list
NAME 	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART        	APP VERSION
nginx	helm     	1       	2024-03-17 17:17:06.242034589 +0000 UTC	deployed	nginx-15.14.0	1.25.4
% make uninstall
release "nginx" uninstalled
```

## The What of it

The `Makefile` fetches kube config from `kind` and replaces `127.0.0.1` with `host.docker.internal` so the `kind` cluster is reachable from within the running container.  

The cluster certificate is issued for `localhost`, not for `host.docker.internal`, so in the `Makefile` we pass `--kube-insecure-skip-tls-verify` to `helm`. This is not ideal and can probably be resolved more securely, without bypassing TLS.
