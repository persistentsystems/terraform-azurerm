output "api_name" {
    value = module.api.api_name
}
output "backend_name" {
    value = module.backend.name
}


output "api_displayname" {
    value = module.api.api_displayname
}

output "endpoint_name" {
    value = module.api.service_settings.endpoint_name
}

output "product_id" {
    value = module.api.service_settings.product_id
}
