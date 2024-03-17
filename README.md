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
