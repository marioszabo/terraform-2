variable "resource_group_name" {
  description = "Name of the resource group in which to create resources"
  type        = string
  default     = "example-rg"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

variable "vm_public_key" {
  description = "SSH public key to provision on the VM"
  type        = string
}

