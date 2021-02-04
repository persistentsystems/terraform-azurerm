module "storage_account" {

  source = "../../base/v1"

  context           = var.context
  service_settings  = merge(var.service_settings,local.service_settings)

}

locals {
  service_settings = {
    name            = "${var.service_settings.name}${random_string.random.result}"
  }
}

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}
