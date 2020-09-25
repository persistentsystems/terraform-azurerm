output "api_name" {
    value = module.api.api_name
}
output "backend_name" {
    value = module.backend.name
}

output "description" {
    value = module.api.service_settings.description
}

output "endpoint_name" {
    value = module.api.service_settings.backend.name
}

output "product_id" {
    value = module.api.service_settings.product_id
}