resource "helm_release" "tekton" {
  name       = "tekton-pipeline"
  repository = "https://tekton-charts.storage.googleapis.com"
  chart      = "tekton-pipeline"
}