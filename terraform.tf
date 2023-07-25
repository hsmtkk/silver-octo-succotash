terraform {
  backend "azurerm" {
    resource_group_name  = "silver-octo-succotash"
    storage_account_name = "silveroctosuccotash"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}