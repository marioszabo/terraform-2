variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to associate with the NIC"
  type        = string
}

variable "nsg_id" {
  description = "ID of the network security group to associate with the NIC (optional)"
  type        = string
  default     = null
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "example-machine"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_F2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "vm_public_key" {
  description = "SSH public key for VM access"
  type        = string
  sensitive   = true
}

variable "enable_public_ip" {
  description = "Whether to assign a public IP to the VM"
  type        = bool
  default     = true
}

