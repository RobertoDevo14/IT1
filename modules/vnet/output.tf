output "vnet_name" {
  value = azurerm_virtual_network.resource_vnet.name
}
output "vnet_id" {
  value = azurerm_virtual_network.resource_vnet.id
}
output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}