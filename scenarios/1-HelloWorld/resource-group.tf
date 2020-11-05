module my_resource_group {
    source  = "../../services/resource-group/base/v1"
    context = var.context 
    name = "myapp-dev-eastus"
}