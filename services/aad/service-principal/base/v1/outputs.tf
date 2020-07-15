output "client_id"{
  value = azuread_service_principal.aad_sp.application_id
}
output "client_secret"{
  value = azuread_service_principal_password.aad_sp.value
}
output "object_id"{
  value = azuread_service_principal.aad_sp.object_id
}