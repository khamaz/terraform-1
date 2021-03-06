resource "kubernetes_persistent_volume" "jira-pv" {
  metadata {
    name = "terraform-jira"
  }

  spec {
    capacity {
      storage = "30Gi"
    }

    access_modes = ["ReadWriteOnce"]
  }
}

resource "kubernetes_persistent_volume_claim" "jira-pvc" {
  metadata {
    name = "terraform-jira"
    namespace = "tools"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests {
        storage = "20Gi"
      }
    }

    volume_name = "${kubernetes_persistent_volume.jira-pv.metadata.0.terraform-jira}"
  }
}
