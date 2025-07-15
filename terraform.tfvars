keyvault = {
  name                        = "KVTESTFERTI4"
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  object_id = "0f71a72f-37e6-47bb-b8c4-c0f28807c38e"

}

tags = {
  subscription = "development"
  subdomain    = "data-architecture"
  domain       = "IT"
  project      = "data-gobernance"
  billing      = "internal"
}

synapse = {
  name                             = "ferdatasynapse02weudevtest"
  storage_data_lake_gen2_filesystem_id = ""
  sql_administrator_login          = "adminuser"
  sql_administrator_password       = "Aq7!xP2vR9sL@eT4zW1u" # Ejemplo seguro, puedes cambiarlo si lo deseas
  location = "East US 2"
  sql_serverless_db_name = "fer_dw_test"
}