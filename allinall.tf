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

#resource "helm_release" "sonarDB" {
#  name = "postgresql"
#  repository = "https://charts.bitnami.com/bitnami"
#  chart = "postgresql"
#
#  set {
#    name  = "global.postgresql.auth.postgresPassword"
#    value = "postgresRootPass"
#  }
#
#  set {
#    name  = "global.postgresql.auth.username"
#    value = "sonarUser"
#  }
#  set {
#    name  = "global.postgresql.auth.password"
#    value = "sonarPass"
#  }
#  set {
#    name  = "global.postgresql.auth.database"
#    value = "sonarDB"
#  }
#  set {
#    name = "service.ports.postgresql"
#    value = "5432"
#  }
#}

resource "helm_release" "sonarqube" {
  name = "sonarqube"
  repository = "https://sonarsource.github.io/helm-chart-sonarqube"
  chart = "sonarqube"
  
  set {
    name  = "persistence.enabled"
    value = "true"
  }
# These two are deprecated?
#  set {
#    name  = "readinessProbe.sonarWebContext"
#    value = "/sonarqube/"
#  }
#  set {
#    name  = "livenessProbe.sonarWebContext"
#    value = "/sonarqube/"
#  }
  set {
    name  = "sonarWebContext"
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
# We have these two defined in a Helm chart, no need in override
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
#  set {
#    name  = "database.type"
#    value = "postgresql"
#  }
#  set {
#    name = "jdbcOverwrite.enable"
#    value = "true"
#  }
#  set {
#    name  = "jdbcOverwrite.jdbcUrl"
#    value = "jdbc:postgresql://10.100.135.218/sonarDB?socketTimeout=1500"
#  }
#  set {
#    name  = "jdbcOverwrite.jdbcUsername"
#    value = "sonarUser"
#  }
#  set {
#    name  = "jdbcOverwrite.jdbcPassword"
#    value = "sonarPass"
#  }
#  set {
#    name  = "postgresql.postgresqlDatabase"
#    value = "sonarDB"
#  }
}
