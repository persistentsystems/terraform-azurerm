locals {
    default_tags = {
      app = var.context.application_name
      env = var.context.environment_name
    }

    final_tags = merge (local.default_tags, var.tags ) 
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = var.service_settings.name
  kubernetes_cluster_id = var.service_settings.kubernetes_cluster_id
  vm_size               = var.service_settings.vm_size
  node_count            = var.service_settings.node_count
  enable_auto_scaling   = var.service_settings.enable_auto_scaling
  mode                  = var.service_settings.mode
  node_labels           = {
    "service"           = var.service_settings.consumerapp_label
  }
  tags = local.final_tags
}