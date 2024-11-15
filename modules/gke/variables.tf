variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet_name" {
  description = "Subnetwork name"
  type        = string
}

variable "ip_range_pods_name" {
  description = "Pods IP range name"
  type        = string
}

variable "ip_range_services_name" {
  description = "Services IP range name"
  type        = string
}

variable "node_pools" {
  description = "List of node pool configurations"
  type = list(object({
    name           = string
    machine_type   = string
    node_locations = string
    min_count      = number
    max_count      = number
    disk_size_gb   = number
    disk_type      = string
    image_type     = string
    auto_repair    = bool
    auto_upgrade   = bool
    preemptible    = bool
  }))
}

variable "enable_private_nodes" {
  description = "Enable private nodes"
  type        = bool
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint"
  type        = bool
}

variable "master_ipv4_cidr_block" {
  description = "IP range for the master network"
  type        = string
}