resource "aws_amplify_app" "this" {
  name         = var.name
  repository   = var.repository
  access_token = var.access_token

  enable_auto_branch_creation = true
  enable_branch_auto_build    = true
  enable_branch_auto_deletion = false

  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    enable_auto_build           = true
    enable_pull_request_preview = true
  }

  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: ${var.base_directory}
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }
}

resource "aws_amplify_branch" "ref" {
  for_each = var.branches

  app_id                = aws_amplify_app.this.id
  branch_name           = each.value.branch_name
  environment_variables = each.value.environment_variables
  stage                 = each.value.stage

  enable_auto_build           = true
  enable_pull_request_preview = true
}

resource "aws_amplify_domain_association" "this" {
  count                 = length(var.subdomains) ? 1 : 0
  app_id                = aws_amplify_app.this.id
  domain_name           = var.domain_name
  wait_for_verification = var.wait_for_verification

  dynamic "sub_domain" {
    for_each = var.subdomains
    content {
      branch_name = sub_domain.value.branch_name
      prefix      = sub_domain.value.prefix
    }
  }
}
