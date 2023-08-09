resource "helm_release" "xhost_app" {
  name       = "xhost-app"
  chart      = "../../apps/xhost-app/helm"

  set {
    name  = "image.repository"
    value = var.app_image_repository
  }

  set {
    name  = "image.tag"
    value = var.app_image_tag
  }
}