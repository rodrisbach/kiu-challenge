resource "kubernetes_ingress_v1" "main" {
  wait_for_load_balancer = true
  metadata {
    name = var.name
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = var.host
      http {
        path {
          path = "/*"
          backend {
            service {
              name = kubernetes_service_v1.main.metadata.0.name
              port {
                number = 8080
              }
            }
          }
        }
      }
    }
  }
}
