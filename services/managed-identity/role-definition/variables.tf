variable "service_settings" {
  type = object({
    name                 = string
    #scope                = string
    description          = string
    actions              = list(string)
    #assignable_scopes    = list(string)
    }
  )
}
