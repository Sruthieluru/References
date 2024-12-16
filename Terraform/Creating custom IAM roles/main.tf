provider "google" { 
  credentials = file("credentials_file.json") 
  region      = "us-central1" 
} 
 
variable "GCP_PROJECT_ID"{ 
    type = string 
} 
