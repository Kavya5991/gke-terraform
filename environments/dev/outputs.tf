output "cluster_name" {
  description = "GKE cluster name"
  value       = module.gke.cluster_name
}

output "cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke.cluster_endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "GKE cluster ca certificate"
  value       = module.gke.cluster_ca_certificate
  sensitive   = true
}

output "kubeconfig_path" {
  description = "Path to kubeconfig file"
  value       = module.gke.kubeconfig_path
}

output "network_name" {
  description = "Name of the VPC"
  value       = module.vpc.network_name
}

output "subnet_name" {
  description = "Name of the subnet"
  value       = module.vpc.subnet_name
}