
resource "azurerm_api_management" "apim" {

  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  publisher_name      = var.service_settings.publisher_name
  publisher_email     = var.service_settings.publisher_email

  sku_name = var.service_settings.sku_name


policy {
    xml_content = <<XML
    <policies>
      <inbound>
	      ${var.policies.inbound}
      </inbound>
      <backend>
	    ${var.policies.backend}
      </backend>
      <outbound > 
	    ${var.policies.outbound} 
      </outbound >
      <on-error>
	    ${var.policies.error}
      </on-error>
    </policies>
XML
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}
