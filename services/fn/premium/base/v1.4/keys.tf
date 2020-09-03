# This will obtain the Azure Function's Key that can be used to integrate with the Azure Function by API Management
resource "azurerm_template_deployment" "azfn_function_key" {
  name = "${var.service_settings.name}-key-rgt"
  parameters = {
    "functionApp" = azurerm_function_app.function_app.name
  }
  resource_group_name    = var.context.resource_group_name
  deployment_mode = "Incremental"

  template_body = <<BODY
  {
      "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
      "contentVersion": "1.0.0.0",
      "parameters": {
          "functionApp": {"type": "string", "defaultValue": ""}
      },
      "variables": {
          "functionAppId": "[resourceId('Microsoft.Web/sites', parameters('functionApp'))]"
      },
      "resources": [
      ],
      "outputs": {
          "functionkey": {
              "type": "string",
              "value": "[listkeys(concat(variables('functionAppId'), '/host/default'), '2018-11-01').functionKeys.default]"
              }
      }
  }
  BODY

  depends_on = [azurerm_function_app.function_app]
}
