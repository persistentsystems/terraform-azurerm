
resource "azurerm_api_management" "apim" {
  name                = var.apim_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  publisher_name      = var.apim_settings.publisher_name
  publisher_email     = var.apim_settings.publisher_email

  sku_name = var.apim_settings.sku_name

  policy {
    xml_content = <<XML
    <policies>
    <inbound>
    </inbound>
    <backend>
      <forward-request />
    </backend>
    <outbound />
    <on-error>
    </on-error>
    </policies>
XML
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}