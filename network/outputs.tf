output "network_interface_id" {
  description = "ID(s) of the network interface(s) created"
  value       = [azurerm_network_interface.example.id]
}

output "public_ip_address" {
  description = "Public IP address allocated for the load balancer"
  value       = azurerm_public_ip.lb-public-ip.ip_address
}
