module "hello_world" {
    source = "../1-HelloWorld"
}

module "keyvault" {
  
  source                    = "../../services/keyvault/endpoint/base/v1"
  # 
  # The context (Where) to deploy the keyvault to
  context                   = module.hello_world.context
  
  # KeyVault specific settings 
  service_settings = {
    name                    = "${module.hello_world.context.application_name}-${module.hello_world.context.environment_name}-${module.hello_world.context.location_suffix}"
    workspace_id            = module.hello_world.observability_settings.workspace_id
    soft_delete_enabled     = false
    
  }

}

