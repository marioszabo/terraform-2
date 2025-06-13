output "public_ip_address" {
  description = "Public IP address allocated to the load balancer"
  value       = module.network.public_ip_address
}
