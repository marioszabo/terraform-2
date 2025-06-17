output "vm_public_ip" {
  description = "ID of the VM public IP address"
  value       = module.vm.vm_public_ip_address
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.MyResource.name
}
