provider "kubernetes" {
  host = "https://connectgateway.googleapis.com/v1/${module.anthos_cluster.fleet_membership}"
  exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "gke-gcloud-auth-plugin"
  }
}

#resource "google_gke_hub_feature" "acm" {
#  provider = google-beta

 # name     = "configmanagement"
 # project  = var.gcp_project_id
 # location = "global"
#}

resource "google_gke_hub_feature_membership" "main" {
  provider = google-beta

  location = "global"
  feature  = "configmanagement"

  membership = var.cluster_name
#module.anthos_cluster.fleet_membership
  project    = var.gcp_project_id

  configmanagement {
    version = "1.11.2"

    config_sync {
      source_format = var.repo_structure

      git {
        sync_repo   = "https://github.com/bkauf/csp-config-management/"
        sync_branch = "1.0.0"
        policy_dir  = "tech-summit"
        secret_type = "none"
      }

    }
     policy_controller {

        enabled = true 
      }
  }

 # depends_on = [google_gke_hub_feature.acm]
}