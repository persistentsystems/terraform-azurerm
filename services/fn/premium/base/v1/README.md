# Create an Azure Function App
## Resources Created

[azurerm_function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app)

[The CLI documentation for this Resource](https://docs.microsoft.com/en-us/cli/azure/functionapp?view=azure-cli-latest#az_functionapp_create)
An Azure Storage account is created via a module call


## Inputs 

- service_settings
  - plan - The App Service Plan ID
  - name - Name of the Azure Function
  - runtime_version (node -> [8, 10, 12, 14 (preview)], java -> [8, 11], powershell -> [7.0], python -> [3.6, 3.7, 3.8, 3.9 (preview)].)
  - runtime_type ( custom, dotnet, java, node, powershell, python) sets the "FUNCTIONS_WORKER_RUNTIME" ENV/ Application Setting.
  - Application Settings Name,Value map of Application Settings


## Outputs

- id - the Function App ID
- name - The Name of app
- hostname - eg: mysite.azurewebsites.net
- identity - The Managed Service Identity for this App Service
  - principal_id
  - tenant_id
- key - The Azure Funcition App Host Key

## Usage

```hcl

module "fn_demo" {
  
  source                  = "../../../submodules/terraform-azurerm/services/fn/premium/base/v1"
  
  context                = local.context 
  observability_settings = local.observability_settings
  service_settings       = {
      plan = module.api_hosting_plan.id
      name = "function1-myapp-dev-us-east"
      runtime_version = "~3"
      runtime_type = "dotnet"
      app_settings = {
        Environment     = module.coreinfra.context.environment_name
        WEBSITE_RUN_FROM_PACKAGE = local.code_drop_url
      }

  }
  ip_rules_settings = {
     user_defined_iplist = [ "123.456.123.123/32" , "10.15.0.1/32]
     # API management will talk to these endpoints, so allow that to happen.
     apim_iplist          = []
     ## Microsoft publishes a list of Public IP ranges for it's services (https://www.microsoft.com/en-us/download/details.aspx?id=56519)
     ## If you have an Azure Service that nees to connect to thsese IPs add them here.
     services_iplist      = []
   }
}
```
