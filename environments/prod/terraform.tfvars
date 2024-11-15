project_id = "gke-terraform-deploy"
region     = "us-east1"
env_name   = "prod"

# Cluster Configuration
cluster_name = "nginx-cluster"
network      = "gke-network"
subnetwork   = "gke-subnet"

# Network Configuration
subnet_cidr            = "10.10.0.0/16"
ip_range_pods_cidr     = "10.20.0.0/16"
ip_range_services_cidr = "10.30.0.0/16"

# Node Pools
node_pools = [
  {
    name           = "nginx-pool-small"
    machine_type   = "e2-small"
    node_locations = "us-east1-b,us-east1-c,us-east1-d"
    min_count      = 1
    max_count      = 3
    disk_size_gb   = 30
    disk_type      = "pd-standard"
    image_type     = "COS_CONTAINERD"
    auto_repair    = true
    auto_upgrade   = true
    preemptible    = false
  },
  {
    name           = "nginx-pool-medium"
    machine_type   = "e2-medium"
    node_locations = "us-east1-b,us-east1-c,us-east1-d"
    min_count      = 1
    max_count      = 3
    disk_size_gb   = 50
    disk_type      = "pd-standard"
    image_type     = "COS_CONTAINERD"
    auto_repair    = true
    auto_upgrade   = true
    preemptible    = false
  }
]

# Private Cluster Configuration
enable_private_nodes    = true
enable_private_endpoint = false
master_ipv4_cidr_block = "172.16.0.0/28"