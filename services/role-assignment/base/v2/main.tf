resource "azurerm_role_assignment" "azure_role_assignment" {
    scope                = var.role_assignment.scope
    role_definition_id = var.role_assignment.role_definition_id
    principal_id         = var.role_assignment.principal_id
}