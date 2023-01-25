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

    endpoint_name    = string
    name             = string
    description      = string
    revision         = string
    path             = string
    primary_protocol = string
    publish          = bool
    product_id       = list(string)
    subscription_required = string

  })
}
variable "policies" {
  type = object({

    inbound          = string
    outbound         = string
    backend          = string
    error            = string

  })
}
variable "backend_settings" {
  type = object({

    function_name = string
    function_key  = string
    protocol      = string

  })
}
variable "okta_settings" {
  type = object({

    domainname = string
    serverid = string
    audience = string

  })
}

variable "observability_settings" {
  type = object({
	  api_logger_id             = string
  })
}

