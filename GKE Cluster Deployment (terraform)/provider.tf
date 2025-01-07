terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "5.18.0"
        }
    }
}

provider "google" {
  credentials = file("credentials_file.json")
  project     = var.project_id
  region      = var.region
}