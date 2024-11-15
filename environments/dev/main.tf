terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.cluster_endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
}

resource "google_project_service" "gcp_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "container.googleapis.com"
  ])

  project = var.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy = false
}

module "vpc" {
  source = "../../modules/vpc"

  project_id             = var.project_id
  env_name               = var.env_name
  region                 = var.region
  network_name           = var.network
  subnetwork_name        = var.subnetwork
  subnet_cidr            = var.subnet_cidr
  ip_range_pods_name     = var.ip_range_pods_name
  ip_range_services_name = var.ip_range_services_name
  ip_range_pods_cidr     = var.ip_range_pods_cidr
  ip_range_services_cidr = var.ip_range_services_cidr
  depends_on = [google_project_service.gcp_apis]
}

module "gke" {
  source = "../../modules/gke"

  project_id             = var.project_id
  env_name               = var.env_name
  region                 = var.region
  cluster_name           = var.cluster_name
  network_name           = module.vpc.network_name
  subnet_name            = module.vpc.subnet_name
  ip_range_pods_name     = var.ip_range_pods_name
  ip_range_services_name = var.ip_range_services_name
  
  node_pools             = var.node_pools
  enable_private_nodes   = var.enable_private_nodes
  enable_private_endpoint = var.enable_private_endpoint
  master_ipv4_cidr_block = var.master_ipv4_cidr_block
  depends_on = [google_project_service.gcp_apis]
}