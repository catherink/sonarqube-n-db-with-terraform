terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.0.3"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress-controller"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}

resource "helm_release" "sonarqube" {
  name = "sonarqube"
  repository = "https://oteemo.github.io/charts"
  chart = "sonarqube"
  
  set {
    name  = "persistence.enabled"
    value = "true"
  }
  set {
    name  = "readinessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "livenessProbe.sonarWebContext"
    value = "/"
  }
  set {
    name  = "replicaCount"
    value = "1"
  }
  set {
    name  = "image.tag"
    value = "8.5.1-community"
  }
  set {
    name  = "postgresql.enabled"
    value = "true"
  }
  set {
    name  = "database.type"
    value = "postgresql"
  }
  set {
    name  = "postgresql.postgresqlServer"
    value = "postgresql"
  }
  set {
    name  = "postgresql.postgresqlUsername"
    value = "sonarUser"
  }
  set {
    name  = "postgresql.postgresqlPassword"
    value = "sonarPass"
  }
  set {
    name  = "postgresql.postgresqlDatabase"
    value = "sonarDB"
  }
  set {
      name  = "postgresql.service.port"
      value = "5432"
    }
}

resource "helm_release" "sonarDB" {
  name = "postgresql"
  repository = "https://charts.bitnami.com/bitnami"
  chart = "postgresql"

  set {
    name  = "postgresqlPostgresPassword"
    value = "postgresRootPass"
  }

  set {
    name  = "postgresqlUsername"
    value = "sonarUser"
  }
  set {
    name  = "postgresqlPassword"
    value = "sonarPass"
  }
  set {
    name  = "postgresqlDatabase"
    value = "sonarDB"
  }
}
