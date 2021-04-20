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
