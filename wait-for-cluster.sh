#!/bin/bash

. env.sh

currentstatus=$(kubectl get tkc ${CLUSTER_NAME} -o=jsonpath='{.status.phase}' -n ${NAMESPACE})
statusdone="running"
while [ "$currentstatus" != "$statusdone" ]
do
  echo "Still Building Cluster"
  sleep 20
  currentstatus=$(kubectl get tkc ${CLUSTER_NAME} -o=jsonpath='{.status.phase}' -n ${NAMESPACE})
  echo "current status: ${currentstatus}"
done

echo "Cluster Build Complete"