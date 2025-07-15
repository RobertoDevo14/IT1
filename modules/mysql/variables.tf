variable "admin_login" {
  type = string
  description = "Login to authenticate to MySQL Server"
  default     = "adminmysql"
}

variable "admin_password" {
  type = string
  description = "Password to authenticate to MySQL Server"
  default = "VdkjzYRrmbC3GSr"
}

variable "mysql_version" {
  type = string
  description = "MySQL Server version to deploy"
  default = "5.7"
}

variable "sku_name" {
  type = string
  description = "MySQL SKU Name"
  default = "GP_Gen5_2"
}
variable "mysql_storage" {
  type = string
  description = "MySQL Storage in MB"
  default = "128000"
}

variable "mysql_name"{
  type        = string
  description = "Mysql Name"
  default     = ""
}

variable "rsg_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  type        = string
  default     = ""
  description = "The Azure location for all resources created by this module."
}

variable "subnet_id"{

}