variable "resource_group_name" {
  description = "Name of the resource group in which to create network resources"
  type        = string
}

variable "location" {
  description = "Location/region for all network resources"
  type        = string
}

variable "vm_count" {
  description = "Number of NICs (one per VM) to create"
  type        = number
}
