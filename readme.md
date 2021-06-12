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

## License

MIT0
