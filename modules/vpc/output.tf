output "network_name" {
  description = "VPC network name"
  value       = module.vpc.network_name
}

output "subnet_name" {
  description = "Subnet name"
  value       = module.vpc.subnets_names[0]
}

output "subnet_id" {
  description = "Subnet ID"
  value       = module.vpc.subnets_ids[0]
}