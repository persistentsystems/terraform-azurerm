resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  dns_prefix          = var.service_settings.name
  enable_pod_security_policy = var.service_settings.enable_pod_security_policy

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


  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}

