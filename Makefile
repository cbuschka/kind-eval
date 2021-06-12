TOP_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all:	create status deploy logs

create:
	$(TOP_DIR)/scripts/install-kind.sh && \
	$(TOP_DIR)/scripts/create-cluster.sh && \
	$(TOP_DIR)/scripts/install-dashboard.sh && \
	$(TOP_DIR)/scripts/install-nginx-ingress.sh

status:
	echo "Docker containers..." && \
	docker ps && \
	echo "Cluster info..." && \
	$(TOP_DIR)/scripts/cluster-info.sh && \
	echo "All services..." && \
	$(TOP_DIR)/scripts/list-services.sh && \
	echo "All pods ..." && \
	$(TOP_DIR)/scripts/list-pods.sh

logs:
	$(TOP_DIR)/scripts/tail-myhello-pod.sh

deploy:
	$(TOP_DIR)/scripts/deploy-myhello-pod.sh

proxy:
	$(TOP_DIR)/scripts/start-proxy.sh

get-dashboard-token:
	$(TOP_DIR)/scripts/get-dashboard-token.sh

destroy:
	$(TOP_DIR)/scripts/destroy-cluster.sh

