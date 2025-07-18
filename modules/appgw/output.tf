output "id" {
  value = azurerm_application_gateway.main.id
}

output "name" {
  value = azurerm_application_gateway.main.name
}

output "location" {
  value = azurerm_application_gateway.main.location
}

output "public_ip_id" {
  value = azurerm_public_ip.publicip.id
}

output "public_ip_address" {
  value = azurerm_public_ip.publicip.ip_address
}
