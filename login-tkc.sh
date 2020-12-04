#!/bin/bash
. env.sh

VSPHERE_WITH_TANZU_CONTROL_PLANE_IP=10.40.14.65
VSPHERE_WITH_TANZU_USERNAME=$1
VSPHERE_WITH_TANZU_PASSWORD=$2

KUBECTL_VSPHERE_PATH=/usr/bin/kubectl-vsphere
KUBECTL_PATH=/usr/bin/kubectl

KUBECTL_VSPHERE_LOGIN_COMMAND=$(expect -c "
spawn $KUBECTL_VSPHERE_PATH login --server=$VSPHERE_WITH_TANZU_CONTROL_PLANE_IP --vsphere-username $VSPHERE_WITH_TANZU_USERNAME --insecure-skip-tls-verify --tanzu-kubernetes-cluster-name ${CLUSTER_NAME}
expect \"*?assword:*\"
send -- \"$VSPHERE_WITH_TANZU_PASSWORD\r\"
expect eof
")

${KUBECTL_PATH} config use-context ${CLUSTER_NAME}
