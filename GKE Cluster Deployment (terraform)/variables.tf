variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "searchai-428205"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "gke-network"
}

variable "subnet_name" {
  description = "VPC subnet name"
  type        = string
  default     = "gke-subnet"
}

variable "cluster_name" {
  description = "GKE Cluster name"
  type        = string
  default     = "gke-cluster"
}

variable "primary_node_pool_name" {
  description = "Name of the primary node pool"
  type        = string
  default     = "primary-node-pool"
}

variable "secondary_node_pool_name" {
  description = "Name of the secondary node pool"
  type        = string
  default     = "secondary-node-pool"
}

variable "service_account_id" {
  description = "Service account ID"
  type        = string
  default     = "gke-sa"
}
