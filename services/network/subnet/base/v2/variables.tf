variable "context" {
  type = object({
    application_name    = string
    environment_name    = string
    resource_group_name = string

    location_suffix = string
    location = string   
   })
}
variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
  
}
variable "service_endpoints" {
  type = list(string)
  
}
