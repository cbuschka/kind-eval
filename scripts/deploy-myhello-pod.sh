#!/bin/bash

PROJECT_DIR=$(cd `dirname $0`/.. && pwd -P)

. ${PROJECT_DIR}/configrc

cat - > /tmp/pod-deployment.yml <<EOB
apiVersion: v1
kind: Service
metadata:
  name: myhello-service
spec:
  selector:
    app: myhello
  ports:
  - port: 8080
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myhello-ingress
spec:
  rules:
  - http:
      paths:
      - path: /myhello
        pathType: Prefix
        backend:
          service:
            name: myhello-service
            port:
              number: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myhello-deployment
  labels:
    app: myhello
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myhello
  template:
    metadata:
      labels:
        app: myhello
    spec:
      containers:
      - image: cbuschka/myhello:4.0
        imagePullPolicy: IfNotPresent
        name: myhello
        ports:
          - containerPort: 8080
        env:
          - name: PORT
            value: "8080"
      restartPolicy: Always
EOB

kubectl --context kind-${CLUSTER_NAME} apply -f /tmp/pod-deployment.yml

echo "myhello should be accessible on http://127.0.0.1:80/myhello in some moments."
