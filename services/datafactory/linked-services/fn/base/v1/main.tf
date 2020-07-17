resource "azurerm_data_factory_linked_service_azure_function" "azfn_linkedsvc" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  data_factory_name   = var.service_settings.data_factory_name
  url = var.service_settings.url
  key                 = var.service_settings.key

}
