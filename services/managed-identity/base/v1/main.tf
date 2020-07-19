data "azurerm_client_config" "current" {}


# This will obtain the Azure Function's Key that can be used to integrate with the Azure Function by API Management
resource "azurerm_template_deployment" "managed_identity_rgt" {
  name = "${var.service_settings.name}-managed-identity-rgt"
  parameters = {
    "resourceName"        = var.service_settings.name
  }
  resource_group_name    = var.context.resource_group_name
  deployment_mode = "Incremental"

  template_body = <<BODY
  {
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "resourceName": {
            "type": "string",
            "metadata": {
                "description": "<USER ASSIGNED IDENTITY NAME>"
            }
            }
    },
    "resources": [
        {
        "type": "Microsoft.ManagedIdentity/userAssignedIdentities",
        "name": "[parameters('resourceName')]",
        "apiVersion": "2018-11-30",
        "location": "[resourceGroup().location]"
        }
    ],
    "outputs": {
        "identityName": {
            "type": "string",
            "value": "[parameters('resourceName')]"
        }
        "principalId": {
            "type": "string",
            "value": "[parameters('principalId')]"
        }
    }
  }
  BODY

}
