# locals {
#   vnet_address_space = "192.168.192.0/22"

#   vnet_i = {
#     vnet_name = module.virtual_network.vnet_name
#     vnet_id   = module.virtual_network.vnet_id
#   }

#   vnet_info = tolist([local.vnet_i])

#   subnets = [
#     {
#       name       = var.subnet-appgw
#       cidr_block = "192.168.192.0/24"
#     },
#     {
#       name       = var.subnet-des-cluster
#       cidr_block = "192.168.193.0/24"
#     }
#   ]
# }

# Resource Group
resource "azurerm_resource_group" "rg_des_pc" {
  name = var.rg_pc_name
  location = var.location
}
module "key_vault" {
  source = "./modules/key_vault"

  name                        = var.keyvault.name
  location                    = var.location
  resource_group_name         = var.rg_pc_name
  enabled_for_disk_encryption = var.keyvault.enabled_for_disk_encryption
  soft_delete_retention_days  = var.keyvault.soft_delete_retention_days
  purge_protection_enabled    = var.keyvault.purge_protection_enabled

  sku_name = var.keyvault.sku_name

  object_id = var.keyvault.object_id

  tags = var.tags
}

# # Virtual Network
# module "virtual_network" {
#   source             = "./modules/vnet/"
#   rsg_name           = azurerm_resource_group.rg_pc.name
#   location           = azurerm_resource_group.rg_pc.location
#   nsg_name           = var.nsg_name
#   vnet_name          = "vnet-des-pc"
#   vnet_adress_spaces = [var.vnet_address_space]
# }

# # Routable Virtual Network Subnets
# module "virtual_network_subnets" {
#   source            = "./modules/subnet/"
#   vnet_name         = data.azurerm_virtual_network.vnet.name
#   rsg_name          = azurerm_resource_group.rg_pc.name
#   subnets           = local.subnets
#   nsg_id            = module.virtual_network.nsg_id
#   nsg_idcl          = data.azurerm_network_security_group.nsg_idcl.id
#   module_depends_on = [module.virtual_network.vnet_id]
# }

# module "appgateway" {
#   source                = "./modules/appgw/"
#   name                  = var.appgw_name
#   rsg_name              = azurerm_resource_group.rg_appgw_pc.name
#   location              = var.location
#   vnet_subnet_id        = data.azurerm_subnet.subnets.id
# }

# module "kubernetes_service" {
#   source                = "./modules/aks/"
#   name                  = var.aks_name
#   rsg_name              = azurerm_resource_group.rg_pc.name
#   location              = var.location
#   vnet_subnet_id        = data.azurerm_subnet.subnets2.id
#   gateway_id            = module.appgateway.id
#   # rg_loganalytics       = azurerm_resource_group.rg_loganalytics.name
#   depends_on            = [module.appgateway]
# }

# module "acr" {
#   source                = "./modules/acr/"
#   acr_name                  = var.acr_name
#   rsg_name              = azurerm_resource_group.rg_pc.name
#   location              = var.location
#   id_aks_ppl            = module.kubernetes_service.system_assigned_identity
#   depends_on            = [module.kubernetes_service]
# }

# module "mysql" {
#   source                = "./modules/mysql/"
#   mysql_name            = var.mysql_name
#   rsg_name              = azurerm_resource_group.rg_pc.name
#   location              = var.location
#   subnet_id             = module.virtual_network_subnets.subnet_id[1]
#   depends_on            = [module.virtual_network_subnets]
# }

# data "azurerm_virtual_network" "vnet" {
#   name                = "vnet-des-pc"
#   resource_group_name = azurerm_resource_group.rg_pc.name
#   depends_on          = [module.virtual_network]
# }

# data "azurerm_subnet" "subnets" {
#   name                = "subnet-des-agw-pc"
#   virtual_network_name= "vnet-des-pc"
#   resource_group_name = azurerm_resource_group.rg_pc.name
#   depends_on          = [module.virtual_network_subnets]
# }

# data "azurerm_subnet" "subnets2" {
#   name                = "subnet-des-cl-pc"
#   virtual_network_name= "vnet-des-pc"
#   resource_group_name = azurerm_resource_group.rg_pc.name
#   depends_on          = [module.virtual_network_subnets]
# }

# data "azurerm_network_security_group" "nsg_idcl" {
#   name                = "nsg-des-cl-pc"
#   resource_group_name = azurerm_resource_group.rg_pc.name
#   depends_on          = [module.virtual_network]
# }


# resource "azurerm_resource_group" "rg_appgw_pc" {
#   name = var.rg_appgw_name
#   location = var.location
#}
# resource "azurerm_resource_group" "rg_loganalytics" {
#   name = var.log_analytics_resource_group
#   location = var.location
# }

module "synapse" {
  source      = "./modules/synapse"
  name        = var.synapse.name
  resource_group_name = var.rg_pc_name #module.resource_group.name
  location    = var.location
  storage_data_lake_gen2_filesystem_id = var.synapse.storage_data_lake_gen2_filesystem_id
  sql_administrator_login    = var.synapse.sql_administrator_login
  sql_administrator_password = var.synapse.sql_administrator_password
  tags        = var.tags
  sql_serverless_db_name = var.synapse.sql_serverless_db_name
}
