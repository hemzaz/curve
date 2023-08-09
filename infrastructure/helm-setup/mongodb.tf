resource "helm_release" "mongodb" {
  name       = "mongodb"
  repository = "https://charts.helm.sh/stable"
  chart      = "mongodb"
  version    = "7.8.1"

  set {
    name  = "mongodbRootPassword"
    value = var.mongodb_root_password
  }

  set {
    name  = "mongodbUsername"
    value = var.mongodb_username
  }

  set {
    name  = "mongodbPassword"
    value = var.mongodb_password
  }

  set {
    name  = "mongodbDatabase"
    value = var.mongodb_database
  }
}