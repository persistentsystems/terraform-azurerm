variable "role_assignment" {
  type = object({
    scope                = string
    role_definition_name = string
    principal_id         = string
    }
  )
}
