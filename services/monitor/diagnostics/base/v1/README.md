# Create a Diagnostic Setting for a resource 

## Azure Resource Created

[azurerm_monitor_diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting)

## Inputs 

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.

- observability - This is an object that describes Log Analytics work space ID and an Azure storage_account for specifying long term storage of logs.  It also specifies action_groups to handle alerts setup by this module.
  
  - retention_policy
    - short_term:  Number of days to keep logs in Log Analytics
    - long_term: Number of days to keeps logs in Azure Storage

## Outputs

None

## Notes
THere are problems with the underlying Microsoft API and the 'log_analytics_destination_type'.  [See GitHub Issue](https://github.com/terraform-providers/terraform-provider-azurerm/issues/6676).  For some resource type the 'Dedicated' setting will not 'stick' and will always need to be applied.  There isn't a workaround yet, so some diagnostic settings will always show an apply needed.


