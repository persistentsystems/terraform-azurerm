output "id" {
  value = module.storage_account.id
}
output "name" {
  value = module.storage_account.name
}
output "primary_access_key" {
  value = module.storage_account.name.primary_access_key
}
output "primary_endpoint" {
  value = module.storage_account.primary_endpoint
}
output "primary_connection_string" {
  value = module.storage_account.primary_connection_string
}