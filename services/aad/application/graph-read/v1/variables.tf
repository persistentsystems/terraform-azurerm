variable "name" {
  type = string
  description = "The name used for the Azure Function Resource"
}
variable "homepage" {
  type = string
  default = "https://localhost"
}
variable "identifier_uris" {
  type = list
  default = []
}
variable "reply_urls" {
  type = list
  default = []
}
variable "available_to_other_tenants" {
  type    = bool
  default = false
}
variable "allow_implicit_flow" {
  type    = bool
  default = false
}