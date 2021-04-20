# Istio 1.7.3

[Istio](https://istio.io/latest/docs/concepts/what-is-istio/), a service mesh to connect, secure, control, and observe services on kubernetes platforms.
At a high level, Istio helps reduce the complexity of these deployments, 
and eases the strain on your development teams.

## Requirements:

You need a running Kubernetes cluster. 

## Install the Istio engine

- Run the init script [demo-init.sh](demo-init.sh) to download and install Istio 1.7.3 
  and then set ingress env exporting `INGRESS_HOST`, `INGRESS_PORT`, `SECURE_INGRESS_PORT`, and `GATEWAY_URL`.

    ![init script logs](img/demo-init-2.png)

    ![gcp.console.kubernetes.workload.istio.init](img/demo-init-1.png)

## Deploy a sample application
- Run the app script [demo-run-app.sh](demo-run-app.sh) to deploy our [app](https://istio.io/docs/examples/bookinfo/)

  ![run app script logs](img/demo-run-app-1.png)

  Accessing the app following the logged url: http://104.197.220.220:80/productpage
  ![run app script logs](img/app-home-page.png)

- Check deployment status (kubernetes namespace=default)

  - On terminal using command: `kubectl get pods --namespace default`
    ![kubectl get pods logs](img/demo-run-app-2.png)

  - On [workload GCP console](https://console.cloud.google.com/kubernetes/workload)
    ![gcp.console.kubernetes.workload.app](img/demo-run-app-3.png)

## Install the Istio tools (UIs)
- The available tools UIs:

  ![kiali graph](img/tools-UIs.png)

- Run the Istio tools setup script [demo-tools.s](demo-tools.sh)

  ![tools script logs](img/demo-tools-1.png)
  ![tools script logs](img/demo-tools-2.png)

- Check deployment status (kubernetes namespace=istio-system)

  - On terminal using command: `kubectl get pods --namespace istio-system`
    ![kubectl get pods logs](img/demo-tools-3.png)

  - On [workload GCP console](https://console.cloud.google.com/kubernetes/workload)
    ![gcp.console.kubernetes.workload.app](img/demo-tools-4.png)

- #### Grafana

  Run this command to start a proxy session accessing Grafana service UI
    ````shell script
    istioctl dashboard grafana
    ````
  ![grafana home](img/grafana-home.png)

  ![grafana query](img/grafana-query.png)

  We will download [grafana-istio-mesh-dashboard.json](grafana-istio-mesh-dashboard.json)
  from [grafana dashboards repository](https://grafana.com/grafana/dashboards/7639)
  and import it on grafana UI. Will produce the following dashboards:

  ![grafana mesh dashboard](img/grafana-mesh-dashboard.png)

  Dashboard of a specific pod (productpage)

  ![grafana productpage pod](img/grafana-productpage-1.png)

  ![grafana productpage pod](img/grafana-productpage-2.png)

  ![grafana productpage pod](img/grafana-productpage-2.png)

- #### Jaeger
  Run this command to start a proxy session accessing jaeger service UI
    ````shell script
    istioctl dashboard jaeger
    ````
  ![jaeger home](img/jaeger-home.png)

  ![jaeger detail](img/jaeger-detail.png)

- #### Kiali

  Start a proxy session rooting to Kiali service UI using command
    ````shell script
    istioctl dashboard kiali
    ````
  ![kiali graph](img/kiali-1.png)

  ![kiali graph](img/kiali-2.png)

  ![kiali graph](img/kiali-3.png)

  ![kiali graph](img/kiali-4.png)

  ![kiali graph](img/kiali-5.png)

- #### Prometheus
  Run this command to start a proxy session accessing Prometheus service UI
    ````shell script
    istioctl dashboard prometheus
    ````
  ![prometheus](img/prometheus.png)

  ![prometheus target](img/prometheus-target.png)

  ![prometheus service discovery](img/prometheus-target.png)

- #### Zipkin
  Run this command to start a proxy session accessing zipkin service UI
    ````shell script
    istioctl dashboard zipkin
    ````
  ![zipkin](img/zipkin-1.png)

  ![zipkin](img/zipkin-2.png)

  ![zipkin](img/zipkin-3.png)

  ![zipkin](img/zipkin-4.png)
    
