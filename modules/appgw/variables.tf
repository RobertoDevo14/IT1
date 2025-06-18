
   
variable "name" {
  description = "Name of Application Gateway service."
}

variable "rsg_name" {
}
variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "sku" {
  description = "(Required) The Name of the SKU to use for this Application Gateway. Possible values are Standard_v2, and WAF_v2"
  type        = string
  default     = "WAF_v2"
}

variable "sku_capacity" {
  description = "(Required) The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU."
  type        = number
  default     = 1
}

variable "vnet_subnet_id" {
  description = "(Required) The ID of the Subnet which the Application Gateway should be connected to."
  type        = string
}

variable "waf_enabled" {
  description = "Is the Web Application Firewall be enabled?"
  default     = false
}

variable "waf_firewall_mode" {
  description = "(Required) The Web Application Firewall Mode. Possible values are Detection and Prevention."
  type        = string
  default     = "Detection"
}

variable "ippublic_name" {
  description = "Public IP to Application Gateway."
  type        = string
  default     = "agw-cs-pc-ip"
}
variable "appgw_name" {
  description = "Name to Application Gateway."
  type        = string
  default     = "agw-cs-pc"
}


variable "gateway_id" {
  description = "(Optional) The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster"
  type        = string
  default     = null
}
