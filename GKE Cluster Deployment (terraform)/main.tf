resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = "us-central1-a"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.gke_network.id
  subnetwork               = google_compute_subnetwork.gke_subnet.id
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.primary_node_pool_name
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"]
	}
  # Enable autoscaling
  autoscaling {
    min_node_count = 1  
    max_node_count = 2
  }
}

resource "google_container_node_pool" "secondary_preemptible_nodes" {
  name       = var.secondary_node_pool_name
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"]
	}
}