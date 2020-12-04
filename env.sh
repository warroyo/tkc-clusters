#!/bin/bash
export NAMESPACE=$(kubectl apply -f cluster.yml --dry-run -o=jsonpath='{.metadata.namespace}')
export CLUSTER_NAME=$(kubectl apply -f cluster.yml --dry-run -o=jsonpath='{.metadata.name}')