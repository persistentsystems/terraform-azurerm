# Create an Application Insights Workspace

## Azure Resources Created

- [azurerm_application_insights](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights)
- [azurerm_monitor_metric_alert](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert)
]

## Inputs

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.

- service_settings

  - name  - Name of the workspace
  - retention_in_days - Number of dahys to retain data
  - action_groups

    These are lists of Azure Monitor Action group ID (create with services/monitor/action-group/* modules)
    - critical - azure monitor ID for critical alerts 
    - high - azure monitor ID for high level alerts
    - moderate - azure monitor ID for moderate level alerts

## Example Usage
```hcl

module "appinsights" {

  source           = "../../../submodules/terraform-azurerm/services/app-insights/endpoint/base/v1"

  context          = module.my_resource_group.context

  service_settings =  {
      name = "${module.my_resource_group.context.application_name}-${module.my_resource_group.context.environment_name}-${module.my_resource_group.context.location.suffix}"
      retention_in_days = 30
      action_groups = {
        critical = [module.alert_group_critical.id ]
        high = []
        moderate = []
      }
  }
  
}
```
