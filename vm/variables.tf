variable "resource_group_name" {
  description = "Name of the resource group in which to create VM resources"
  type        = string
}

variable "location" {
  description = "Location/region for VM resources"
  type        = string
}

variable "network_interface_id" {
  description = "List of network interface IDs to attach to the VMs"
  type        = list(string)
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 2
}

variable "vm_public_key" {
  description = "SSH public key to provision on the VM"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Linux VMs"
  type        = string
  default     = "adminuser"
}
