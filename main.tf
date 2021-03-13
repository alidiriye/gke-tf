module "cluster0" {
  source = "./clusters"
  name   = "${terraform.workspace}-k8s-cluster"
}

module "cluster1" {
  source = "./clusters"
  name   = "${terraform.workspace}-k8s-helmcluster"
}