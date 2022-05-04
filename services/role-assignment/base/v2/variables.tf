variable "role_assignment" {
  type = object({
    scope                = string
    role_definition_id   = string
    principal_id         = string
    }
  )
}
