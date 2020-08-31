variable "name" { }
variable "storage_account_name" { }
variable "access_type" {
    default = "private"
}
variable "retention_policy" {
    type    = number
    default = 90
}

variable "storage_version" {
    default = "2.0"
}
