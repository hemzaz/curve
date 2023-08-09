data "aws_ecr_authorization_token" "example" {
  registry_id = aws_ecr_repository.xhost_app.registry_id
}

resource "kubernetes_secret" "ecr_auth" {
  metadata {
    name = "ecr-auth"
  }

  data = {
    ".dockerconfigjson" = data.aws_ecr_authorization_token.example.authorization_token
  }

  type = "kubernetes.io/dockerconfigjson"
}
