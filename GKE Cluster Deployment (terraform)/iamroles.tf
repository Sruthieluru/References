
# 1. IAM Role Configuration
resource "google_project_iam_custom_role" "gke_role" {
  project     = var.project_id
  role_id     = "GKECustomRole"
  title       = "GKE Custom Role"
  description = "Custom role for managing GKE cluster"
  permissions = [
    "container.clusters.create",
    "container.clusters.update",
    "container.clusters.get",
    "container.clusters.delete"
  ]
}

resource "google_service_account" "gke_service_account" {
  account_id   = var.service_account_id
  display_name = "GKE Service Account"
}

resource "google_project_iam_binding" "gke_roles" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"
  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}"
   ]
}

resource "google_project_iam_binding" "network_roles" {
  project = var.project_id
  role    = "roles/compute.networkAdmin"
  members = [
    "serviceAccount:${google_service_account.gke_service_account.email}"
  ]
}
