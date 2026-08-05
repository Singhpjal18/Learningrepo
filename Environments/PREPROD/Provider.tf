terraform {
  required_providers {
    required_version = ">= 1.15.8"
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}
provider "azurerm" {
  features {}
}