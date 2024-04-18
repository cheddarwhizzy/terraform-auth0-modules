resource "auth0_action" "my_action" {
  name    = var.name
  runtime = var.runtime
  code    = try(fileexists(var.code), false) ? file(var.code) : var.code
  deploy  = var.deploy

  supported_triggers {
    id      = var.supported_triggers.id
    version = var.supported_triggers.version
  }

  dynamic "secrets" {
    for_each = var.secrets
    content {
      name  = secrets.key
      value = secrets.value
    }
  }

  dynamic "dependencies" {
    for_each = var.dependencies
    content {
      name    = dependencies.value["name"]
      version = dependencies.value["version"]
    }
  }
}
