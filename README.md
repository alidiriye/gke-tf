README.md

Assume you have created All the serviceaccount with editor rihgts and have deployed the gcr images.
GKE 1: Building GKE with Terraform
Step 1: Initialize Environment
terraform init
Step 2: Configure Variables
export TF_VAR_project=$(gcloud config get-value project)
export TF_VAR_region="us-central1"
export TF_VAR_cluster_name="my-terraform-gke-cluster"
Step 3: Provision a Cluster
terraform apply
Watch for results:

watch gcloud container clusters list \
   --filter name=my-terraform-gke-cluster
Step 4: Get Credentials
gcloud container clusters get-credentials $TF_VAR_cluster_name \
  --region $TF_VAR_region
Verify:

kubectl config get-contexts
Step 5: Test Cluster with Hello-Kubernetes
Step 6: Test Deployed Application
This will forward ports from one of the pods to localhost.

Step 7: Cleanup

terraform destroy
Remove KUBECONFIG entry pointing to destroyed cluster:
