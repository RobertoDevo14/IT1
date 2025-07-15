resource "null_resource" "module_depends_on" {
  triggers = {
    value = length(var.module_depends_on)
  }
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rsg_name
  depends_on          = [null_resource.module_depends_on]
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index].name
  resource_group_name  = var.rsg_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes       = var.subnets[count.index].cidr_block
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_subnet_network_security_group_association" "nsg" {
  subnet_id                 = azurerm_subnet.subnet[1].id
  network_security_group_id = var.nsg_idcl
}
