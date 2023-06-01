variable "gcp_project_id" {
    type = string
    description = "GCP Project id"
    default = "fc-labs-pro-lab2"
}

variable "gcp_region" {
    type = string
    description = "Region for our GCP project"
    default = "europe-southwest1"
}

variable "gke_cluster_name" {
    type = string
    description = "Cluster name for our GKE"
    default = "gke-pokemon"
}

variable "gke_zone" {
    type = string
    description = "List of zones for our GKE cluster"
    default = "europe-southwest1-a"
}

variable "gke_zones" {
    type = list(string)
    description = "List of zones for our GKE cluster"
    default = ["europe-southwest1-a"]
}


variable "gke_network" {
    type = string
    description = "VPC Network for our GKE cluster"
    default = "pokemon-network"
}

variable "gke_subnetwork" {
    type = string
    description = "VPC Subnetwork for our GKE cluster"
    default = "pokemon-subnetwork"
}

variable "gke_default_nodepool_name" {
    type = string
    description = "Default node pool name"
    default = "default-node-pool"
}

variable "gke_service_account" {
    type = string
    description = "GKE service account"
    default = "tf-gke-gke-pokemon-yawm@fc-labs-pro-lab2.iam.gserviceaccount.com"
}