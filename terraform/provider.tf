provider "google" {
  alias = "initial"
}

data "google_service_account_access_token" "default" {
  provider               = google.initial
  target_service_account = "fc-labs-pro-sa@fc-bootstrap.iam.gserviceaccount.com"
  scopes                 = ["cloud-platform"]
  lifetime               = "3600s"
}

provider "google" {
  access_token           = data.google_service_account_access_token.default.access_token
  project                = var.gcp_project_id
}



