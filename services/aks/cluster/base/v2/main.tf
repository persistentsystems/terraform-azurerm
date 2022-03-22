locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}
resource "azurerm_kubernetes_cluster" "cluster" {
  name                = var.service_settings.name
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  dns_prefix          = var.service_settings.name
  enable_pod_security_policy = var.service_settings.enable_pod_security_policy
  #api_server_authorized_ip_ranges = var.service_settings.api_server_authorized_ip_ranges

  node_resource_group = var.service_settings.resource_group_name
  kubernetes_version  = var.service_settings.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.service_settings.node_count
    #node_count = var.service_settings.node_count
    vm_size     = var.service_settings.node_size
    tags        = local.final_tags
    vnet_subnet_id = var.service_settings.vnet_subnet_id
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
  }
  role_based_access_control {
    enabled = var.service_settings.rbac_enabled
  }
  network_profile {
    network_plugin= "azure"
    load_balancer_sku = "standard"
  }

  tags = local.final_tags

}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [azurerm_kubernetes_cluster.cluster]

  create_duration = "30s"
}

# resource "null_resource" "next" {
#   depends_on = [time_sleep.wait_30_seconds]
# }

resource "null_resource" "network_contributor" {
  provisioner "local-exec" {
    command = "az role assignment create --assignee ${azurerm_kubernetes_cluster.cluster.identity[0].principal_id} --scope ${var.service_settings.vnet_subnet_id} --role 'Network Contributor' "
  }
  depends_on = [time_sleep.wait_30_seconds]
}

# resource "azurerm_role_assignment" "aks" {
#   principal_id         = azurerm_kubernetes_cluster.cluster.identity[0].principal_id
#   role_definition_name = "Network Contributor"
#   scope                = var.service_settings.vnet_subnet_id
# }

### Not required atm
# resource "azurerm_role_assignment" "kubweb_to_acr" {
#   scope                = "/subscriptions/634cdf5a-6a7b-4bae-828b-41e87ab1378c/resourceGroups/fdb-terraform/providers/Microsoft.ContainerRegistry/registries/fdbeprescription"
#   role_definition_name = "AcrPull"
#   principal_id         = azurerm_kubernetes_cluster.cluster.identity[0].principal_id
# }
