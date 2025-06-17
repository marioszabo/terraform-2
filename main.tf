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
  name     = var.resource_group_name
  location = var.location
}


module "network" {
  source              = "./network"
  resource_group_name = var.resource_group_name
  location            = var.location

  depends_on = [azurerm_resource_group.MyResource]
}

module "vm" {
  source              = "./vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  nsg_id              = module.network.nsg_id # Optional
  vm_public_key       = var.vm_public_key
  enable_public_ip    = true
}
