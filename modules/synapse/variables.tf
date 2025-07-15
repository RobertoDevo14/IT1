variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "storage_data_lake_gen2_filesystem_id" { type = string }
variable "sql_administrator_login" { type = string }
variable "sql_administrator_password" { type = string }
variable "tags" { type = map(string) }
variable "sql_serverless_db_name" { type = string }