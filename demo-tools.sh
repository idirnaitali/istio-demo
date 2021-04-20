echo "--------------------------------------- Start deploying tools ---------------------------------------------------"

echo "Deploying grafana................................................................................................"
# Doc: https://istio.io/latest/docs/ops/integrations/grafana
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/grafana.yaml

echo "Deploying jaeger................................................................................................."
# Doc: https://istio.io/latest/docs/ops/integrations/jaeger
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/jaeger.yaml

echo "Deploying kiali.................................................................................................."
# Doc: https://istio.io/latest/docs/ops/integrations/kiali
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/kiali.yaml

echo "Deploying prometheus............................................................................................."
# Doc: https://istio.io/latest/docs/ops/integrations/prometheus
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/prometheus.yaml

echo "Deploying zipkin................................................................................................."
# Doc: https://istio.io/latest/docs/ops/integrations/zipkin
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.7/samples/addons/extras/zipkin.yaml

echo "--------------------------------------- Tools [grafana, jaeger, kiali, prometheus, zipkin] deployed -------------"
