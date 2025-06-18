variable "location" {
  type        = string
  default     = "westeurope"
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

variable "rsg_name"{
  type        = string
  description = "RG Name"
  default     = "rg-pc"
}