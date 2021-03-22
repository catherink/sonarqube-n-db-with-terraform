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
  repository = "https://kubernetes-charts.storage.googleapis.com/"
  chart = "stable/sonarqube"
  
  set {
    name  = "persistence.enabled"
    value = "true"
  }
  set {
    name  = "readinessProbe.sonarWebContext"
    value = "/sonarqube/"
  }
  set {
    name  = "livenessProbe.sonarWebContext"
    value = "/sonarqube/"
  }
  set {
    name  = "mysql.mysqlParams.useSSL"
    value = "false"
  }
  set {
    name  = "replicaCount"
    value = "3"
  }
  set {
    name  = "image.tag"
    value = "7.8-community"
  }
  set {
    name  = "postgresql.enabled"
    value = "false"
  }
  set {
    name  = "mysql.enabled"
    value = "true"
  }
  set {
    name  = "database.type"
    value = "mysql"
  }
  set {
    name  = "mysql.mysqlServer"
    value = "mysql-mysql"
  }
  set {
    name  = "mysql.mysqlUser"
    value = "mysqluser"
  }
  set {
    name  = "mysql.mysqlPassword"
    value = "mysqlpass"
  }
  set {
    name  = "mysql.mysqlDatabase"
    value = "mysqlsonarqubedb"
  }
}

resource "helm_release" "mysql" {
  name = "mysql"
  repository = "https://kubernetes-charts.storage.googleapis.com/"
  chart = "stable/mysql"

  set {
    name  = "mysqlRootPassword"
    value = "mysqlrootpass"
  }

  set {
    name  = "mysqlUser"
    value = "mysqluser"
  }
  set {
    name  = "mysqlPassword"
    value = "mysqlpass"
  }
  set {
    name  = "mysqlDatabase"
    value = "mysqlsonarqubedb"
  }
}
