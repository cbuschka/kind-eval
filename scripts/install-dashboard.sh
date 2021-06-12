#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

kubectl --context kind-${CLUSTER_NAME} apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.2.0/aio/deploy/recommended.yaml

cat - > /tmp/dashboard-security-config.yml <<EOB
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOB
kubectl --context kind-${CLUSTER_NAME} apply -f /tmp/dashboard-security-config.yml
