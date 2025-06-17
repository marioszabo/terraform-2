output "vm_public_ip_address" {
  description = "ID of the VM public IP address"
  value       = azurerm_public_ip.example.id
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.example.id
}
