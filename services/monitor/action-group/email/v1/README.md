# Create an Azure Monitor Action Group

## Azure Resources Created
- [azurerm_monitor_action_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group)

## Inputs

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.

- Service Settings
  - name - Full Name of Action Group
  - short_name - concatenated name of Action Group
  - subscriber_name  - Name to send email to
  - subscriber_email - Email address to send alert to.  This would normally be a distribution list or a shared account.

## Outputs
  - id - action group ID, to be used to send alerts to.