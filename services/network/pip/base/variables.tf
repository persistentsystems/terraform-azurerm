variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    resource_group_name = string

    location_suffix = string
    location = string
    
 

  })
}

variable "name" {
  type = string
}
variable "sku" {
  type = string
}
variable "allocation_method" {
  type = string
}


variable "availability_zone" {
  type = string
}
