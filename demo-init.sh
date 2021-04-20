echo "------------------------------------------ Start initialising Istio env -----------------------------------------"

echo "Downloading Istio 1.7.3 ..."
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.7.3 sh -
export PATH=$PWD/istio-1.7.3/bin:$PATH

echo "Connecting to the kubernetes cluster 'your-cluster-name-xxxxx'..."
gcloud container clusters get-credentials your-cluster-name-xxxxx --zone us-central1-c --project your-project-id-xxxxx

echo "Deploying the Istio engine with demo profile..."
istioctl install --set profile=demo

echo "Enable Istio injection to automatically inject Envoy sidecar proxies"
kubectl label namespace default istio-injection=enabled

echo "Setting Ingress env..."
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

# if load balancer exposed using a host name
# export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

echo "INGRESS_HOST = $INGRESS_HOST"
echo "INGRESS_PORT = $INGRESS_PORT"
echo "SECURE_INGRESS_PORT = $SECURE_INGRESS_PORT"
echo "GATEWAY_URL = $GATEWAY_URL"

echo "------------------------------------------ Istio env initialized ------------------------------------------------"
