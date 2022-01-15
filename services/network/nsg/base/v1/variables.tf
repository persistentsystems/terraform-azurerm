variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string
    location_suffix     = string
    location            = string   
   })
}

variable "nsg_name" {
  type = string
}

variable tags {
  type = map    
}