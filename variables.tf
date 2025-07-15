variable "location" {
  type        = string
  default     = "east us"
  description = "The Azure location for all resources created by this module."
}
/*************************************/
# Virtual Network Variables
/*************************************/

variable "vnet_address_space" {
  type        = string
  default = "192.168.192.0/22"
  description = "VNET Address space"
}
variable "nsg_name" {
  type        = string
  default     = "nsg-des-cl-pc"
  description = "The Azure NSG for frontend subnet."
}

variable "rg_pc_name" {
  type        = string
  default     = "rg_des_pc"
  description = "Resorce Group Name."
}

variable "rg_appgw_name" {
  type        = string
  default     = "rg_cs_pc"
  description = "Resorce Group Name."
}

# variable "log_analytics_resource_group" {
#   description = "The resource group name of the Analytics workspace"
#   type        = string
#   default     = "rg_loganalytics_pc"
# }

# /*************************************/
# #Variables
# /*************************************/

variable "subnet-des-cluster" {
  type        = string
  description = "Subnet des cluster Name"
  default     = "subnet-des-cl-pc"#"192.168.193.0/24"
}

variable "subnet-appgw" {
  type        = string
  description = "Subnet Application Gateway Name"
  default     = "subnet-des-agw-pc" #"192.168.192.0/24"
}

variable "appgw_name" {
  type        = string
  description = "Application Gateway Name"
  default     = ""
}

variable "aks_name" {
  type        = string
  description = "Kubernetes Name"
  default     = ""
}

variable "acr_name" {
  type        = string
  description = "ACR Name"
  default     = "acrtestjuanan"
}

variable "mysql_name"{
  type        = string
  description = "Mysql Name"
  default     = "mysql-pc"
}

variable "resource_group_name"{
  type        = string
  description = "RG Name"
}

  variable "tenant_id"  {
  type        = string
  description = "tenant_id"
  }

  
  variable "subscription_id"  {
  type        = string
  description = "subscription_id"
  default     = "7aa14d1d-adf2-4b1f-8e24-335ac92393f5"
  }  
    variable "client_id"  {
  type        = string
  description = "client_id"
  }

    variable "client_secret"  {
  type        = string
  description = "client_secret"
  sensitive = true
  }

  variable "tags" {
  type = any
}
variable "object_id" {
  type = string
  default = "0f71a72f-37e6-47bb-b8c4-c0f28807c38e"
}
variable "keyvault" {
  description = "the object with the variables to the deployment"
  type        = any
}

variable "synapse" {
  description = "Parámetros para el despliegue de Azure Synapse."
  type = object({
    name                                 = string
    storage_data_lake_gen2_filesystem_id = string
    sql_administrator_login              = string
    sql_administrator_password           = string
    location = string
    sql_serverless_db_name = string
  })
}

