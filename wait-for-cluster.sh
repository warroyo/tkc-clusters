./login.sh

kubectl config use-context ${input.super_ns}

currentstatus=$(kubectl get tkc -o=jsonpath='{.items[0].status.phase}')
statusdone="running"
while [ $currentstatus != $statusdone ]
do
  echo "Still Building Cluster"
  sleep 20
  currentstatus=$(kubectl get tkc -o=jsonpath='{.items[*].status.phase}')
done

echo "Cluster Build Complete"