#!/bin/bash

echo "attaching ${CLUSTER_NAME} to TMC"

TMC_API_TOKEN=$1
 tmc login --name cs-gitops
tmc cluster attach -g vra-gitops -n ${CLUSTER_NAME}
kubectl apply -f k8s-attach-manifest.yaml