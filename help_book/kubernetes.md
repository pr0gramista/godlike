# Kubernetes
K8s specific commands (do not include platform specific like gcloud)

[Official Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

```
# Get YAML for something fe. deployment my-app
kubectl get deploy my-app -o yaml --export

# Updating image of deployment
kubectl set image deployments/ball8 ball8=pr0gramista/ball8:1.0.1

# Alternative for --watch
watch -n 1 'kubectl get pods'

# Autoscaling in one command
kubectl autoscale deployment ball8 --cpu-percent=50 --min=1 --max=1 --horizontal-pod-autoscaler-downscale-delay 1m
```

## Ubuntu debug setup
Perfect for learning about K8s internals

First spawn a pod
```
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-pod
spec:
  containers:
  - name: ubuntu
    image: ubuntu:latest
    command: ["/bin/bash", "-c", "while true; do sleep 30; done;"] # This is needed to keep the container alive
```
Save it as ubuntu-pod.yaml
```
kubectl apply -f ubuntu-pod.yaml
```
Connect to it using
```
kubectl exec -it pod/ubuntu-pod -- /bin/bash  
```
Install my basic tools and send some request
```
apt update
apt install -y python3-pip build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget curl micro dnsutils
pip install 'httpx[cli]' --break-system-packages
```
Send a request
```
ls /var/run/secrets/kubernetes.io/serviceaccount
cat /var/run/secrets/kubernetes.io/serviceaccount/token # Show token
echo $KUBERNETES_SERVICE_HOST

# From https://kubernetes.io/docs/tasks/run-application/access-api-from-pod/#without-using-a-proxy
# Point to the internal API server hostname
APISERVER=https://kubernetes.default.svc

# Path to ServiceAccount token
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

# Read this Pod's namespace
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

# Read the ServiceAccount bearer token
TOKEN=$(cat ${SERVICEACCOUNT}/token)

# Reference the internal certificate authority (CA)
CACERT=${SERVICEACCOUNT}/ca.crt

# Explore the API with TOKEN
curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api
httpx -h Authorization "Bearer ${TOKEN}" ${APISERVER}/api --no-verify

# You can get OpenAPI spec for the K8s API Server
# httpx -h Authorization "Bearer ${TOKEN}" ${APISERVER}/openapi/v2 --no-verify
```
