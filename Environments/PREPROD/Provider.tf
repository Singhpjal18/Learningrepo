terraform {
  required_providers {
    azurerm = {
        Source = "hashicorp/azurerm"
        version = "5.0.0"
    }
  }
}
provider "Azurerm" {
    features {}
}