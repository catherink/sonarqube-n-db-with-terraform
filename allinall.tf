terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
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
  set {
    name = "service.port"
    value = "5432"
  }
}

resource "helm_release" "sonarqube" {
  name = "sonarqube"
  repository = "https://sonarsource.github.io/helm-chart-sonarqube"
  chart = "sonarqube"
  
  set {
    name  = "persistence.enabled"
    value = "true"
  }
# This two are deprecated?
  set {
    name  = "readinessProbe.sonarWebContext"
    value = "/sonarqube/"
  }
  set {
    name  = "livenessProbe.sonarWebContext"
    value = "/sonarqube/"
  }
  set {
    name  = "replicaCount"
    value = "1"
  }
#  set {
#    name  = "image.tag"
#    value = "10.1.0"
#  }
#  set {
#    name  = "securityContext.privileged"
#    value = "true"
#  }
#  set {
#    name  = "securityContext.allowPrivilegeEscalation"
#    value = "true"
#  }
  set {
    name  = "nginx.enabled"
    value = "false"
  }
  set {
    name  = "initSysctl.enabled"
    value = "true"
  }
  set {
    name  = "initFs.enabled"
    value = "true"
  }
  set {
    name  = "monitoringPasscode"
    value = "passcode"
  }
  set {
    name  = "postgresql.enabled"
    value = "false"
  }
  set {
    name  = "database.type"
    value = "postgresql"
  }
#  set {
#    name  = "postgresql.postgresqlServer"
#    value = "sonarqubedatabase-postgresql"
#  }
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
}
