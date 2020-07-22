resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.service_settings.name}"
  location            = var.context.location
  resource_group_name = var.context.resource_group_name
  dns_prefix          = "${var.service_settings.name}"

  default_node_pool {
    name       = "default"
    node_count = var.service_settings.node_count
    vm_size    = var.service_settings.node_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    app = var.context.application_name
    env = var.context.environment_name
  }
}
