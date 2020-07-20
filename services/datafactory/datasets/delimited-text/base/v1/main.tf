resource "azurerm_data_factory_dataset_delimited_text" "delimited-text_dataset" {
  name                = var.service_settings.name
  resource_group_name = var.context.resource_group_name
  data_factory_name   = var.service_settings.data_factory_name
  linked_service_name = var.service_settings.linked_service_name

  azure_blob_storage_location {
    container = var.service_settings.container
    path         = var.service_settings.path
    filename     = var.service_settings.filename
  }

  column_delimiter    = ","
  row_delimiter       = "NEW"
  encoding            = "UTF-8"
  quote_character     = "x"
  escape_character    = "f"
  first_row_as_header = true
  null_value          = "NULL"
}
