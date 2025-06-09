terraform {
  cloud {
    organization = "Marios-test"

    workspaces {
      name = "terraform-2"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "MyResource" {
  name     = "example-name"
  location = "eastus"
}
