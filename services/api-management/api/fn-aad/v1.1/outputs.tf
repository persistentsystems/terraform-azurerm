output "api_name" {
    value = module.api.api_name
}
output "backend_name" {
    value = module.api.backend_name
}
output "api_description" {
    value = module.api.service_settings.description
}
output "api_endpoint_name" {
    value = module.api.service_settings.endpoint_name
}