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
