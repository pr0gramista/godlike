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
