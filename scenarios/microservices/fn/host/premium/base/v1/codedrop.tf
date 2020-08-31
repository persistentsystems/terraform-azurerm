
module "code_storage" {
  
  source           = "../../../../../../../services/storage/endpoint/base/v1"
  context          = var.context

  service_settings = {
    name = "code"
    tier = "Standard"
    type = "GRS"
  }

}

/*
resource "null_resource" "cli-codestorage-log" {
  provisioner "local-exec" {
    command = "az storage logging update --log rwd --retention 365 --services b --version 2.0 --account-name ${module.code_storage.name} --account-key ${module.code_storage.primary_access_key}"
  }
}

resource "null_resource" "cli-codestorage-metrics" {
  provisioner "local-exec" {
    command = "az storage metrics update --account-name ${module.code_storage.name} --api true --hour true --minute true --retention 365 --services b --account-key ${module.code_storage.primary_access_key}"
  }
}
*/

resource "azurerm_storage_container" "code_storage" {
  name                    = "drop"
  storage_account_name    = module.code_storage.name
  container_access_type   = "private"
}

/* Generates a Blob SAS Token that can be used by the Azure Function to securely access the deployment package */

data "azurerm_storage_account_sas" "code_storage" {
  
  connection_string = module.code_storage.primary_connection_string
  https_only        = true

  resource_types {
    service   = false
    container = false
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  start  = timestamp()
  expiry = timeadd(timestamp(), "2160h")

  permissions {
    read    = true
    write   = false
    delete  = false
    list    = false
    add     = false
    create  = false
    update  = false
    process = false
  }
}
