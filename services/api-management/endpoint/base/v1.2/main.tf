
resource "azurerm_api_management" "apim" {

  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  publisher_name      = var.service_settings.publisher_name
  publisher_email     = var.service_settings.publisher_email

  sku_name = var.service_settings.sku_name

locals {
  policy_xml = <<XML

    ${var.policies.inbound}
    ${var.policies.backend}
    ${var.policies.outbound}
    ${var.policies.error}

XML
}

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}