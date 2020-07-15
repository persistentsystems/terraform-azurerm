resource "azuread_application" "aad_app" {
  name                        = var.name
  homepage                    = var.homepage
  identifier_uris             = var.identifier_uris
  reply_urls                  = var.reply_urls
  available_to_other_tenants  = var.available_to_other_tenants
  oauth2_allow_implicit_flow  = var.allow_implicit_flow
  group_membership_claims     = "SecurityGroup"

  required_resource_access {
    
    resource_app_id = "00000003-0000-0000-c000-000000000000"
    
    resource_access {
      id   = "5b567255-7703-4780-807c-7be8301ae99b"
      type = "Role"
    }
    resource_access {
      id   = "98830695-27a2-44f7-8c18-0c3ebc9698f6"
      type = "Role"
    }
    resource_access {
      id   = "df021288-bdef-4463-88db-98f22de89214"
      type = "Role"
    }
  }

}

resource "random_password" "aad_app" {
  length                = 16
  special               = true
  override_special      = "_%@"
}

resource "azuread_application_password" "aad_app" {
  application_object_id = azuread_application.aad_app.object_id
  value                 = random_password.aad_app.result
  end_date              = "2021-01-01T01:02:03Z"
}