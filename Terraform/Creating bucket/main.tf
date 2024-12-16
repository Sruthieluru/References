import { 
  id = "cedar-context-433909-d9/sruthi_btin_230" 
  to = google_storage_bucket.auto-approve 
} 

 

provider "google" { 
  credentials = file("credentials_file.json") 
  region      = "us-central1" 
  zone        = "us-central1-a" 
} 

 

# data "google_storage_bucket" "existing_bucket" { 
#   name          = "sruthi_btin_230" 
# } 

 

resource "google_storage_bucket" "auto-approve" { 
  # count = try(data.google_storage_bucket.existing_bucket.id, "") == "" ? 1 : 0 
  name = "sruthi_btin_230" 
  # project       = "cedar-context-433909-d9"  
  location                 = "us-central1" 
  force_destroy            = true 
  public_access_prevention = "enforced" 
} 

 

variable "storage_account_names" { 
  type    = list(string) 
  default = ["five/", "six/","seven/"] 
} 

 

resource "google_storage_bucket_object" "sample_folder" { 
  for_each = toset(var.storage_account_names) 
  name     = each.value 
  content  = " " 
  bucket   = "sruthi_btin_230" 
} 

 

terraform { 
  backend "gcs" { 
    bucket = "sruthi_btin_230" 
    prefix = "terraform/state" 
  } 
} 
