terraform {
  backend "gcs" {
    bucket = "gke-terraform-remotestate"
    prefix = "terraform/statefile"
  }
}