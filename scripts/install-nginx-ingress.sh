#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

kubectl --context kind-${CLUSTER_NAME} apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

kubectl --context kind-${CLUSTER_NAME}  wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
