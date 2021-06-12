#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

cat - > /tmp/kind-cluster-config.yml <<EOB
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: "ingress-ready=true"
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    listenAddress: "127.0.0.1"
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
    listenAddress: "127.0.0.1"
- role: worker
EOB

kind create cluster --name ${CLUSTER_NAME} --config /tmp/kind-cluster-config.yml
