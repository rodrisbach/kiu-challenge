resource "kubernetes_horizontal_pod_autoscaler_v1" "main" {
  metadata {
    name      = var.name
    namespace = kubernetes_namespace_v1.main.id
  }

  spec {
    max_replicas = 5
    min_replicas = 1

    target_cpu_utilization_percentage = 80

    scale_target_ref {
      kind = "Deployment"
      name = kubernetes_deployment_v1.main.metadata[0].name
    }
  }
}
