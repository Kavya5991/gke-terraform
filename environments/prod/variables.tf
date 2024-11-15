# Cluster Variables
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region to host the cluster in"
  type        = string
  default     = "us-east1"
}

variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "nginx-cluster"
}

# Network Variables
variable "network" {
  description = "VPC network name"
  type        = string
  default     = "gke-network"
}

variable "subnetwork" {
  description = "Subnetwork name"
  type        = string
  default     = "gke-subnet"
}

variable "subnet_cidr" {
  description = "CIDR for the subnet"
  type        = string
  default     = "10.10.0.0/16"
}

# IP Ranges
variable "ip_range_pods_name" {
  description = "Secondary IP range for pods name"
  type        = string
  default     = "ip-range-pods"
}

variable "ip_range_services_name" {
  description = "Secondary IP range for services name"
  type        = string
  default     = "ip-range-services"
}

variable "ip_range_pods_cidr" {
  description = "CIDR for pods IP range"
  type        = string
  default     = "10.20.0.0/16"
}

variable "ip_range_services_cidr" {
  description = "CIDR for services IP range"
  type        = string
  default     = "10.30.0.0/16"
}

# Node Pool Configuration
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

# Private Cluster Configuration
variable "enable_private_nodes" {
  description = "Enable private nodes"
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  description = "Enable private endpoint"
  type        = bool
  default     = false
}

variable "master_ipv4_cidr_block" {
  description = "Master IP CIDR block"
  type        = string
  default     = "172.16.0.0/28"
}