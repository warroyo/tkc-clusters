#!/bin/bash

echo "attaching ${CLUSTER_NAME} to TMC"

export TMC_API_TOKEN=$1
tmc login --no-configure
tmc cluster attach -g vra-gitops -n ${CLUSTER_NAME}
kubectl apply -f k8s-attach-manifest.yaml