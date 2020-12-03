#!/bin/bash

VSPHERE_WITH_TANZU_CONTROL_PLANE_IP=${input.control_plane_ip}
VSPHERE_WITH_TANZU_USERNAME=${var.vsphere_user}
VSPHERE_WITH_TANZU_PASSWORD=${var.vsphere_password}


KUBECTL_VSPHERE_PATH=/usr/local/bin/kubectl-vsphere
KUBECTL_PATH=/usr/local/bin/kubectl

KUBECTL_VSPHERE_LOGIN_COMMAND=$(expect -c "
spawn $KUBECTL_VSPHERE_PATH login --server=$VSPHERE_WITH_TANZU_CONTROL_PLANE_IP --vsphere-username $VSPHERE_WITH_TANZU_USERNAME --insecure-skip-tls-verify
expect \"*?assword:*\"
send -- \"$VSPHERE_WITH_TANZU_PASSWORD\r\"
expect eof
")

${KUBECTL_PATH} config use-context $VSPHERE_WITH_TANZU_CONTROL_PLANE_IP
