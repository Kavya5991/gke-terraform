module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version = "24.1.0"

  project_id = var.project_id
  name       = "${var.cluster_name}-${var.env_name}"
  regional   = true
  region     = var.region

  network    = var.network_name
  subnetwork = var.subnet_name

  ip_range_pods     = var.ip_range_pods_name
  ip_range_services = var.ip_range_services_name

  enable_private_nodes    = var.enable_private_nodes
  enable_private_endpoint = var.enable_private_endpoint
  master_ipv4_cidr_block = var.master_ipv4_cidr_block

  node_pools = var.node_pools
}

module "gke_auth" {
  source       = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  version      = "24.1.0"
  depends_on   = [module.gke]
  project_id   = var.project_id
  location     = module.gke.location
  cluster_name = module.gke.name
}

resource "local_file" "kubeconfig" {
  content  = module.gke_auth.kubeconfig_raw
  filename = "kubeconfig-${var.env_name}"
}