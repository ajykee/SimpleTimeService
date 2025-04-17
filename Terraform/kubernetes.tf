provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.auth.token
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_name

  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "auth" {
  name = module.eks.cluster_name

  depends_on = [module.eks]
}

resource "kubernetes_deployment" "simpletimesvc" {
  metadata {
    name = "simpletimesvc"
    labels = {
      app = "simpletimesvc"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "simpletimesvc"
      }
    }
    template {
      metadata {
        labels = {
          app = "simpletimesvc"
        }
      }
      spec {
        container {
          image = "var.container_image"
          name  = "simpletimesvc"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "simpletimesvc" {
  metadata {
    name = "simpletime-svc"
  }
  spec {
    selector = {
      app = "simpletimesvc"
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 3000
    }
  }
}
