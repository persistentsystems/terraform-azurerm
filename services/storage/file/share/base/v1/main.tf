resource "azurerm_storage_share" "fileshare" {

  name                      = var.service_settings.name
  storage_account_name = var.service_settings.storage_account_name
  quota                = var.service_settings.quota

  acl {
    id = "supratim_fileshare_testing"

    access_policy {
      permissions = "rwdl"
      start       = "2020-07-14T09:38:21.0000000Z"
      expiry      = "2020-07-15T10:38:21.0000000Z"
    }
  }

/*  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
*/
}
