resource "google_compute_network" "pokemon_network" {
  name = var.gke_network
  project = var.gcp_project_id
}

resource "google_compute_subnetwork" "pokemon_subnetwork" {
  name          = var.gke_subnetwork
  ip_cidr_range = "10.2.0.0/16"
  region        = var.gcp_region
  network       = google_compute_network.pokemon_network.id
}
