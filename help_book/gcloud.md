# Google Cloud CLI

```
# Get list of projects
gcloud projects list

# Set project
gcloud config set project <name>

# Get list of clusters (K8s)
gcloud container clusters list

# Update kubectl credentials/config to desired cluster
gcloud container clusters get-credentials <cluster name>
```
Cloud Build
```
# Run build from local machine, last argument is directory to send (remember to remove big chunks like node_modules)
gcloud builds submit --substitutions _WOW=wow --config client/cloudbuild.yaml .

# Checkout how it will be runned, verify YAML
# Note: you need to install this gcloud component
cloud-build-local --config client/cloudbuild.yaml --dryrun=true
```
