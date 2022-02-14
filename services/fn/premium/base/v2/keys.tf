data azurerm_function_app_host_keys azfn_function_keyv2 {
  depends_on = [azurerm_function_app.function_appv2]
  name       = azurerm_function_app.function_appv2.name
  resource_group_name    = var.context.resource_group_name 
}


# resource "time_sleep" "wait_120_seconds" {
#   depends_on = [data.azurerm_function_app_host_keys.azfn_function_keyv2]

#   create_duration = "120s"
# }

# # This resource will create (at least) 30 seconds after null_resource.previous
# resource "null_resource" "next_keys" {
#   depends_on = [time_sleep.wait_120_seconds]
# }