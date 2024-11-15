# Terraform GKE Infrastructure

This repository contains Terraform configurations for deploying a Google Kubernetes Engine (GKE) cluster with custom node pools.

## Infrastructure Overview

- **VPC Module**: Creates a VPC network with subnets and secondary IP ranges
- **GKE Module**: Deploys a GKE cluster with two node pools
  - nginx-pool-small (e2-small)
  - nginx-pool-medium (e2-medium)
- **Region**: US East1
- **Environment**: Production

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Required GCP APIs
The following APIs will be automatically enabled:
- Compute Engine API (compute.googleapis.com)
- Kubernetes Engine API (container.googleapis.com)


## Repository Structure

```plaintext
.
├── environments/
│   └── prod/
│       ├── main.tf          # Main configuration file
│       ├── variables.tf     # Variable definitions
│       ├── outputs.tf       # Output definitions
│       └── terraform.tfvars # Variable values
│   └── dev/
│       ├── main.tf          # Main configuration file
│       ├── variables.tf     # Variable definitions
│       ├── outputs.tf       # Output definitions
│       └── terraform.tfvars # Variable values
├── modules/
│   ├── vpc/                # VPC network module
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── gke/                # GKE cluster module
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── backend.tf              # Backend configuration
└── versions.tf             # Provider and version constraints
```

## Configuration

1. Update `environments/prod/terraform.tfvars` with your values:
```hcl
project_id = "your-project-id"
region     = "us-east1"
```

2. Configure GCS backend in `backend.tf`:
```hcl
terraform {
  backend "gcs" {
    bucket = "your-terraform-state-bucket"
    prefix = "your-prefix"
  }
}
```

## Usage

1. Initialize Terraform:
```bash
cd environments/prod
terraform init
```

2. Review the plan:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

## Clean Up

To destroy all resources:
```bash
terraform destroy
```

## Outputs

- `cluster_name`: Name of the GKE cluster
- `cluster_endpoint`: Endpoint for the GKE cluster (sensitive)
- `cluster_ca_certificate`: Cluster CA certificate (sensitive)
- `network_name`: Name of the VPC network
- `subnet_name`: Name of the subnet
