# kind-eval

### Local k8s cluster setup based on kind with nginx ingress exposed on 0.0.0.0:80/:443

## Prerequisites
* linux
* gnu make
* docker

## Usage

### Install and create cluster
```
make create
```

### Deploy a hello service
```
make deploy
```

### Show status
```
make status
```

### Show logs
```
make logs
```

### Run proxy (runs in foreground)
```
make proxy
```

### Open dashboard

* Get a bearer token to login to dashboard

```
make get-dashboard-token
```

Open ```http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/``` with your browser.

### Cleanup
```
make destroy
```

## TODOs

* add letsencrypt support - https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nginx-ingress-with-cert-manager-on-digitalocean-kubernetes
* namespace for app
* deployment via ssh and kind load image-archive

## References

* Kind quickstart guide: https://kind.sigs.k8s.io/docs/user/quick-start
* Kind ingress config: https://kind.sigs.k8s.io/docs/user/ingress/
* Install dashboard: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
* Dashboard auth: https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md
* Deployment descriptor format: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
* Kubectl cheatsheet: https://kubernetes.io/docs/reference/kubectl/cheatsheet/#interacting-with-running-pods

## License

MIT0
