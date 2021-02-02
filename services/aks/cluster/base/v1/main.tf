resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.service_settings.name
  location            = var.context.location.name
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
module diagnostics {
  source                 = "../../../../monitor/diagnostics/base/v1"
  context                = var.context
  observability_settings = var.observability_settings
  service_settings = {
    name        = var.service_settings.name 
    resource_id = azurerm_kubernetes_cluster.cluster.id 
    logs        = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs
    metrics     = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics 
  }
}
