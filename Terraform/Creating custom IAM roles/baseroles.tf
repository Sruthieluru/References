resource "google_project_iam_custom_role" "bigquery_rw_role" { 
  role_id     = "bigQueryReadWriteRole" 
  title       = "BigQuery Read and Write Role" 
  description = "Custom IAM role for granting read and write access to BigQuery." 
  project     = var.GCP_PROJECT_ID 
 
  permissions = [ 
    "bigquery.datasets.create", 
    "bigquery.datasets.get", 
    "bigquery.datasets.update", 
    "bigquery.jobs.create", 
    "bigquery.jobs.get", 
    "bigquery.tables.create", 
    "bigquery.tables.get", 
    "bigquery.tables.update", 
    "bigquery.tables.list" 
    
  ]  
  stage = "GA" 
} 
 
resource "google_project_iam_member" "role_binding" { 
  project = var.GCP_PROJECT_ID 
  role    = "projects/${var.GCP_PROJECT_ID}/roles/bigQueryReadWriteRole"  # Correctly referencing the role 
  member  = "user:Gayathri.Kallam@bilvantis.io" 
} 
