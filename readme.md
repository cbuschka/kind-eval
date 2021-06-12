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

### Cleanup
```
make destroy
```

## License

MIT0
