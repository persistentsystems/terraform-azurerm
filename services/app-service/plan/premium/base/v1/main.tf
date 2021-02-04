
resource "azurerm_app_service_plan" "app_service_plan" {

  name                = "plan-${var.service_settings.name}"
  location            = var.context.location.name
  resource_group_name = var.context.resource_group_name
  kind                = "elastic"

  sku {
    tier = "ElasticPremium"
    size = var.service_settings.size
    capacity = var.service_settings.minimum_instance_count
  }

  maximum_elastic_worker_count = var.service_settings.maximum_instance_count

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }

}

module "func_storage" {
  
  source                = "../../../../../../services/storage/endpoint/randomized/v1"
  context   = var.context

  service_settings = {
    name                  = "func"
    tier                  = "Standard"
    type                  = var.service_settings.storage_type
    security_settings     = {
      allow_blob_public_access = false
      min_tls_version          = "TLS1_2"
    }
  }

}
data "azurerm_storage_account_sas" "code_storage" {
  
  connection_string = module.func_storage.primary_connection_string
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
  expiry = timeadd(timestamp(), "2160h")  # 2160 hrs = 90 days

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
