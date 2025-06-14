output "network_interface_id" {
  description = "ID(s) of the network interface(s) created"
  value       = azurerm_network_interface.example[*].id
}

output "vm_public_ips" {
  value = azurerm_public_ip.vm_public_ip[*].ip_address
}
