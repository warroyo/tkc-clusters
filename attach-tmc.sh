#!/bin/bash

. env.sh

TMC_API_TOKEN=$1

tmc cluster attach -g vra-gitops -n ${CLUSTER_NAME}
kubectl apply -f k8s-attach-manifest.yaml