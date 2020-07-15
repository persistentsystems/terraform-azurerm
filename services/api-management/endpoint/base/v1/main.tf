
resource "azurerm_api_management" "apim" {
  name                = var.apim_settings.name
  location            = var.environment.location
  resource_group_name = var.environment.resource_group_name
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
    app = var.environment.app_name
    env = var.environment.env_name
  }

}

/*
resource "azurerm_api_management_diagnostic" "apim_diagnostic" {
  identifier          = "applicationinsights"
  resource_group_name = var.environment.resource_group_name
  api_management_name = azurerm_api_management.apim.name
  enabled             = true
}
*/