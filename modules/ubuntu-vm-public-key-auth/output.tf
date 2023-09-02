output "public_ip" {
  value = azurerm_public_ip.public.ip_address
}

output "public_ip_id" {
  value = azurerm_public_ip.public.id
}
