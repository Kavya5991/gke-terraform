variable "project_id" {
  description = "The project ID"
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

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnetwork_name" {
  description = "Subnetwork name"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
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

variable "ip_range_pods_cidr" {
  description = "CIDR range to use for pods"
  type        = string
}

variable "ip_range_services_cidr" {
  description = "CIDR range to use for services"
  type        = string
}