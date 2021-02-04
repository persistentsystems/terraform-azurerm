resource "azurerm_api_management" "apim" {

  name                = "apim-${var.service_settings.name}"
  location            = var.context.location.name
  resource_group_name = var.context.resource_group_name
  publisher_name      = var.service_settings.publisher.name
  publisher_email     = var.service_settings.publisher.email

  sku_name = "${var.service_settings.tier}_${var.service_settings.capacity}"

  policy {
    xml_content = <<XML
    <policies>
      <inbound>
	      ${var.service_settings.policies.inbound}
      </inbound>
      <backend>
		    ${var.service_settings.policies.backend}
      </backend>
      <outbound > 
	    ${var.service_settings.policies.outbound} 
      </outbound >
      <on-error>
	    ${var.service_settings.policies.error}
      </on-error>
    </policies>
XML
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}