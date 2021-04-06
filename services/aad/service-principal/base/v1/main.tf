
resource "azuread_service_principal" "aad_sp" {
  application_id        = var.application_id
  
}

resource "random_password" "aad_sp" {
  length                = 16
  special               = true
  override_special      = "_%@"
}

resource "azuread_service_principal_password" "aad_sp" {
  service_principal_id  = azuread_service_principal.aad_sp.id
  value                 = random_password.aad_sp.result
  end_date              = "2028-01-01T01:02:03Z"
}