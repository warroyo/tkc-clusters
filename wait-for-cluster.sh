#!/bin/bash

NAMESPACE=$(kubectl apply -f cluster.yml --dry-run -o=jsonpath='{.metadata.namespace}')
CLUSTER_NAME=$(kubectl apply -f cluster.yml --dry-run -o=jsonpath='{.metadata.name}')
currentstatus=$(kubectl get tkc ${CLUSTER_NAME} -o=jsonpath='{.items[0].status.phase}' -n ${NAMESPACE})
statusdone="running"
while [ "$currentstatus" != "$statusdone" ]
do
  echo "Still Building Cluster"
  sleep 20
  currentstatus=$(kubectl get tkc ${CLUSTER_NAME} -o=jsonpath='{.items[*].status.phase}' -n ${NAMESPACE})
  echo "current status: ${currentstatus}"
done

echo "Cluster Build Complete"