

locals {
  datalake_url = "https://${azurerm_storage_account.synapse_storage.name}.dfs.core.windows.net/${azurerm_storage_container.synapse_container.name}"
}

resource "azurerm_storage_account" "synapse_storage" {
  name                     = "fstasynrg02weudev"  #"synapsestorage${random_string.suffix.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true  # Required for Data Lake Gen2
}

resource "azurerm_storage_container" "synapse_container" {
  name                  = "sycondev"
  storage_account_id  = azurerm_storage_account.synapse_storage.id
  container_access_type = "private"
}


resource "azurerm_synapse_workspace" "synapse" {
  name                                 = var.name
  resource_group_name                  = var.resource_group_name
  location                             = "East US 2"
  storage_data_lake_gen2_filesystem_id = local.datalake_url
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password = var.sql_administrator_password
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

# resource "azurerm_synapse_sql_pool" "serverless" {
#   name                 = "serverless"
#   synapse_workspace_id = azurerm_synapse_workspace.synapse.id
#   sku_name             = "DW100c"
#   create_mode          = "Default"
#   storage_account_type = "GRS"
# }

resource "null_resource" "create_sql_serverless_db" {
  provisioner "local-exec" {
    interpreter = ["cmd", "-c"]
    command = <<-EOT
    c:/sqlcmd/sqlcmd.exe -S ${var.name}-ondemand.sql.azuresynapse.net -d master -U ${var.sql_administrator_login} -P ${var.sql_administrator_password} -Q "CREATE DATABASE ['${var.sql_serverless_db_name}'];"

EOT
  }

  triggers = {
    workspace = var.name
    db        = var.sql_serverless_db_name
  }

  depends_on = [azurerm_synapse_workspace.synapse]
}