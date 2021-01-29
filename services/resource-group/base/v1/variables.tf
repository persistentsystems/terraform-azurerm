variable "context" {
  type = object({

    application_name    = string
    environment_name    = string
    location            = object({
      name   = string
      suffix = string
      number = number 
    })
  })
}
output context_defaults {
  value = {
    application_name = "myapp"
    environment_name = "dev"
    location = {
      name   = "East US"
      suffix = "east-us"
      number = 1
    }

  }

}
variable "name" { 
  description = "The resource group created is rg-{this value}.  It allows a longer resouce group name."
}