resource "kubernetes_service_v1" "main" {
  metadata {
    name      = var.name
    namespace = kubernetes_namespace_v1.main.id
  }
  spec {
    selector = {
      app = var.name
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "ClusterIP"
  }
}
