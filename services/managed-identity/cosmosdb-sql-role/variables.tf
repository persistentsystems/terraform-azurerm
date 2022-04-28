variable "service_settings" {
  type = object({
    resource_group_name  = string
    account_name = string
    role_definition_id = string
    principal_id = string
    scope = string
  })
}