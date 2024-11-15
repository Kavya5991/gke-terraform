module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"

  project_id   = var.project_id
  network_name = "${var.network_name}-${var.env_name}"

  subnets = [
    {
      subnet_name   = "${var.subnetwork_name}-${var.env_name}"
      subnet_ip     = var.subnet_cidr
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    "${var.subnetwork_name}-${var.env_name}" = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = var.ip_range_pods_cidr
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = var.ip_range_services_cidr
      },
    ]
  }
}