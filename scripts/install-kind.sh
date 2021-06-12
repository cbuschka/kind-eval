#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

mkdir -p ~/bin && \
if [ ! -f ~/bin/kind ]; then \
	curl -Lo ~/bin/kind https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64 && \
	chmod +x ~/bin/kind; \
fi
