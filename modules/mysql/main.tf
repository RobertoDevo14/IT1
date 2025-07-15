resource "azurerm_mysql_server" "mysql-server" {
  name = var.mysql_name
  location = var.location
  resource_group_name = var.rsg_name
 
  administrator_login = var.admin_login
  administrator_login_password = var.admin_password
 
  sku_name = var.sku_name
  version = var.mysql_version
 
  storage_mb = var.mysql_storage
  auto_grow_enabled = true
  
  backup_retention_days = 7
  geo_redundant_backup_enabled = false  
  public_network_access_enabled = true
  ssl_enforcement_enabled = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}

resource "azurerm_mysql_virtual_network_rule" "endpoint" {
  name                = "mysql-aks-endpoint"
  resource_group_name = var.rsg_name
  server_name         = var.mysql_name
  subnet_id           = var.subnet_id
}