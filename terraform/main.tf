resource "google_storage_bucket_iam_member" "member" {
  bucket = "artifacts.fc-labs-pro-lab2.appspot.com"
  role = "roles/storage.objectViewer"
  member = "serviceAccount:${var.gke_service_account}"
}

#resource "google_service_account" "service_account" {
#  account_id   = "var.gke_service_account"
#  isplay_name = "Service Account"
#}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gcp_project_id
  name                       = var.gke_cluster_name
  region                     = var.gcp_region
  regional                   = false  
  zones                      = var.gke_zones
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  #agregar rangos de ip para pods y servicios?
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = true
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-medium"
      min_count                 = 1
      max_count                 = 20
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = 30
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true
      service_account           = var.gke_service_account
      preemptible               = false
      initial_node_count        = 1
    },
  ]
}
