output "name" {
    value = "${lookup(azurerm_template_deployment.managed_identity_rgt.outputs, "identityName")}"
}