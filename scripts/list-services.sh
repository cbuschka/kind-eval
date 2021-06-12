#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

kubectl --context kind-${CLUSTER_NAME} get services --all-namespaces
