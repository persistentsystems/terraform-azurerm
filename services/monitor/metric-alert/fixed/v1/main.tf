locals {

  #### - Converting list to list of objects before passing to dynamic block
  action_list = [
    for action_id in var.actions.ids: {
      id = action_id
    }
  ] 

}


resource "azurerm_monitor_metric_alert" "alert" {

  name                = "alert-${random_string.random.result}"
  resource_group_name = var.context.resource_group_name
  scopes              = var.metric.scopes
//  description         = "Action will be triggered when Transactions count is greater than 50."

  criteria {
    metric_namespace = var.metric.namespace
    metric_name      = var.metric.name
    aggregation      = var.threshold.aggregation
    operator         = var.threshold.operator
    threshold        = var.threshold.value

    dynamic "dimension" {
      for_each = var.threshold.dimensions
        content {
          
          name = dimension.value.name
          operator = dimension.value.operator
          values = dimension.value.values

        }
    }
  }

  severity = var.threshold.severity

  dynamic "action" {
    for_each = var.actions.ids
      content {
        
        action_group_id = action.value

      }
  }
}

resource "random_string" "random" {
  length = 8
  special = false
  lower = true
  upper = false
}
