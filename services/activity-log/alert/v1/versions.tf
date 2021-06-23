terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.45.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0.0"
    }
    time = {
      source = "hashicorp/time"
      version = "~> 0.6.0"
    }
  }
  required_version = ">= 0.13"
}
