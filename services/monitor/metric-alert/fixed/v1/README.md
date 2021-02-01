# Create a Static Threshold Alert

Using the Thresholds in Azure Monitor, create an Alert when a metric crosses a value.

## Inputs 

- context - This is the output of the resource-group module.  Which provides azure location and resource group to provision infrastructure in.

- actions - A list of Action IDs (see services/monitor/action-group)

- metric - An object that sets a metric to be watched over several object.
  - scopes - A list of objects to be watched for this metric
  - namesspace - The Namespace for the metric we are going to watch.
  - name - The Name of the specific metric.

- threshold - Allows you to set multiple thresholds on different dimensions within the namespace.

## Example Usage

This module is called by the KeyVault module.  If you look at the 02-keyvault demonstration scenario, you can see how a KeyVault is created and how Dynamic and Static alearts are created.

```
module "keyvault_availability" {

  source = "../../../../monitor/metric-alert/fixed/v1"

  context = var.context

  actions = {
    ids = var.observability_settings.action_groups.moderate
  }

  metric = {
    scopes    = [ local.resource_id ]
    namespace = "Microsoft.KeyVault/vaults"
    name      = "Availability"
  }

  threshold = {
    operator    = "LessThan"
    aggregation = "Average"
    value       = 99
    severity    = 1
    dimensions  = []
  }

}

```

