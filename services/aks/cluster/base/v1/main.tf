resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  dns_prefix          = var.service_settings.name
  enable_pod_security_policy = var.service_settings.enable_pod_security_policy
  api_server_authorized_ip_ranges = var.service_settings.api_server_authorized_ip_ranges

  node_resource_group = var.service_settings.resource_group_name

  default_node_pool {
    name       = "default"
    node_count = var.service_settings.node_count
    enable_auto_scaling = true
    min_count   = var.service_settings.node_min_count
    max_count   = var.service_settings.node_max_count
    vm_size     = var.service_settings.node_size
  }

  identity {
    type = "SystemAssigned"
  }
  addon_profile {
        oms_agent {
            enabled = true
            log_analytics_workspace_id = var.observability_settings.workspace_id 
        }
        #http_application_routing {
        #    enabled = var.http_routing 
        #}
        kube_dashboard {
          enabled = true 
        }
  }
  role_based_access_control {
    enabled = var.service_settings.rbac_enabled
  }
  network_profile {
    network_plugin= "kubenet"
    load_balancer_sku = "standard"
  }


  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}
data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_kubernetes_cluster.cluster.id
}
resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings_log_analytics" {
  name                           = "Send all to log analytics"
  target_resource_id             = azurerm_kubernetes_cluster.cluster.id
  log_analytics_workspace_id     = var.observability_settings.workspace_id
  # This setting has skew and will constantly apply, so I set it to
  # ignore changes.  As we are hard-coding this value, it should 
  # never change anyway.
  log_analytics_destination_type = "Dedicated"
  lifecycle {
    ignore_changes = [ log_analytics_destination_type ]
  }

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs

    content {
      category = log.value
      enabled  = true
      retention_policy {
        enabled = true 
        days    = var.observability_settings.retention_days
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics

    content {
      category = metric.value
      enabled  = true
      retention_policy {
        enabled = false
        days    = var.observability_settings.retention_days
      }
    }
  }
}
resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings_azure_storage" {
  name                  = "Send all to Azure Storage"
  target_resource_id    = azurerm_kubernetes_cluster.cluster.id
  storage_account_id    = var.observability_settings.storage_account

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs

    content {
      category = log.value
      enabled  = true
      retention_policy {
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics

    content {
      category = metric.value
      enabled  = true
      retention_policy {
        enabled = false
      }
    }
  }
}

