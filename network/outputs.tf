output "network_interface_id" {
  description = "ID(s) of the network interface(s) created"
  value       = azurerm_network_interface.example[*].id
}

