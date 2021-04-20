echo "--------------------------------------- Start deploying our book info app ---------------------------------------"

echo "Deploying the application..."
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.5/samples/bookinfo/platform/kube/bookinfo.yaml

echo "Deploying a gateway service to open the application to outside traffic..."
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.5/samples/bookinfo/networking/bookinfo-gateway.yaml

echo "Access the application with the following link: http://$GATEWAY_URL/productpage"

echo "--------------------------------------- book info app deployed --------------------------------------------------"
