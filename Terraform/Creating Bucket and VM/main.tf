provider "google" { 
  credentials = file("credentials_file.json") 
  region      = "us-central1" 
  zone        = "us-central1-a" 
} 

variable "GCP_PROJECT_ID"{ 
    type = string 
} 

resource "google_storage_bucket" "auto-expire" { 
  name          = "gcp_vm_bucket_1" 
  project      = var.GCP_PROJECT_ID  
  location      = "US" 
  force_destroy = true 
  public_access_prevention = "enforced" 
} 

resource "google_compute_instance" "vm_instance" { 
  name         = "sruthi-free-tier-vm"          
  machine_type = "f1-micro"                 
  project      = var.GCP_PROJECT_ID                 
  boot_disk { 
    initialize_params { 
      image = "debian-cloud/debian-11"     
    } 
  } 
  network_interface { 
    network = "default"                    
    access_config {                          
      // Ephemeral IP 
    } 
  } 
} 
