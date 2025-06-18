resource "azurerm_network_security_group" "nsg" {
    name                = var.nsg_name
    location            = var.location
    resource_group_name = var.rsg_name
  }

  resource "azurerm_network_security_rule" "outbound_rule" {
    name                        = "deny-InternetOutBound"
    priority                    = 4096
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "Internet"
    resource_group_name         = var.rsg_name
    network_security_group_name = azurerm_network_security_group.nsg.name
  }
  
  resource "azurerm_virtual_network" "resource_vnet" {
    name                = var.vnet_name
    location            = var.location
    resource_group_name = var.rsg_name
  
    address_space = var.vnet_adress_spaces  
    depends_on = [
      azurerm_network_security_group.nsg
    ]
  }

