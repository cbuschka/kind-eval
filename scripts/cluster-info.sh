#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

kubectl cluster-info --context kind-${CLUSTER_NAME}
