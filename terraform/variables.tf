variable "gcp_project_id" {
    type = string
    description = "GCP Project id"
}

variable "gcp_region" {
    type = string
    description = "Region for our GCP project"
}

variable "gke_cluster_name" {
    type = string
    description = "Cluster name for our GKE"
}

variable "gke_zone" {
    type = string
    description = "List of zones for our GKE cluster"
}

variable "gke_zones" {
    type = list(string)
    description = "List of zones for our GKE cluster"
}

variable "gke_network" {
    type = string
    description = "VPC Network for our GKE cluster"
}

variable "gke_subnetwork" {
    type = string
    description = "VPC Subnetwork for our GKE cluster"
}

variable "gke_firewall" {
    type = string
    description = "Firewall for our GKE cluster allow ssh"
}

variable "gke_default_nodepool_name" {
    type = string
    description = "Default node pool name"
}

variable "gke_service_account" {
    type = string
    description = "GKE service account"
}