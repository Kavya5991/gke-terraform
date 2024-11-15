output "cluster_name" {
  description = "GKE cluster name"
  value       = module.gke.name
}

output "cluster_endpoint" {
  description = "GKE cluster endpoint"
  value       = module.gke.endpoint
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "GKE cluster ca certificate"
  value       = module.gke.ca_certificate
  sensitive   = true
}

output "kubeconfig_path" {
  description = "Path to kubeconfig file"
  value       = local_file.kubeconfig.filename
}