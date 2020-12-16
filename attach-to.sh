#!/bin/bash
echo "attaching ${CLUSTER_NAME} to TMC"

export TMC_API_TOKEN=$1
export WAVEFRONT_TOKEN=$2

 export ACCESS_TOKEN=$(curl -s -X POST https://console.cloud.vmware.com/csp/gateway/am/api/auth/api-tokens/authorize\?refresh_token\=$TMC_API_TOKEN | jq -r '.access_token')


curl --location --request POST "https://westtanzuseamericas.tmc.cloud.vmware.com/v1alpha1/clusters/${CLUSTER_NAME}/integrations" \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer ${ACCESS_TOKEN}" \
--data-raw '{
	"integration": {
		"full_name":{
			"provisionerName": "attached",
            "managementClusterName": "attached",
			"name": "tanzu-observability-saas"
		},
		"spec":{
			"configurations": {
				"url": "https://vmware.wavefront.com/api/"
			},
			"secrets": {
				"token": "'${WAVEFRONT_TOKEN}'"
			}
		}
	}
}'