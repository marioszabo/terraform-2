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
}

resource "azurerm_resource_group" "MyResource" {
  name     = "example-name"
  location = "eastus"
}

resource "azurerm_virtual_network" "MyNetwork" {
  name                = "my-network"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.MyResource.name
  address_space       = ["10.0.0.0/16"]
}
