resource "kubernetes_namespace_v1" "main" {
  metadata {
    annotations = {
      name = var.name
    }

    labels = {
      app = var.name
    }

    name = var.name
  }
}
