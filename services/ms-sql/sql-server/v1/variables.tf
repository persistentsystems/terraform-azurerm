
variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string
    location            = string
    location_suffix     = string

  })
}
variable "service_settings" {
  type = object({
    name                            = string
    version                         = string
    administrator_login             = string
    administrator_login_password    = string
    minimum_tls_version             = string
    identity                        = string
    azuread_administrator_login     = string
    public_network_access_enabled   = bool
  })
}

variable tags {

  type = map
    
}

# variable "firewall_rule_settings" {
#   type = object({
#     start_ip_address          = string 
#     end_ip_address            = string
#   })
# } 

variable "mssql_auditing_policy" {
  type = object({
    
    storage_endpoint                = string
    storage_account_access_key      = string
    storage_account_access_key_is_secondary = bool
    retention_in_days               = number
  })
}

variable "mssql_vulnerability" {
  type = object({
    storage_container_path                  = string
    storage_account_access_key              = string
    recurring_scans_enabled                 = bool
    recurring_email_subscription_admins     = bool
    recurring_emails                        = string
  })
}