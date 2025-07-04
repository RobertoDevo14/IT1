variable "name" {
  description = "Name of Azure Kubernetes service."
}

variable "aks_name"{
  type        = string
  description = "Kubernetes Name"
  # 2021-09-28: Remove Vnet To Hub Peering feature, make this parameter optional
  default     = "aks-des-pc"
}

variable "rsg_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "rg_loganalytics" {
  description = "resource grop log analytics"
  default     = ""
}

# variable "resource_group_name" {
#   description = "A container that holds related resources for an Azure solution"
#   default     = "rg-demo-westeurope-01"
# }

variable "location" {
  # description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  # default     = "westeurope"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = "default"
}

variable "default_vm_size" {
  description = "The size of the Virtual Machine, such as Standard_D2s_V4"
  type        = string
  default     = "Standard_D2ds_v4"
}

variable "availability_zones" {
  description = "A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  type        = list(string)
  default     = []
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  type        = string
  default     = "Free"
}

variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
  default     = false
}

variable "authorized_ips" {
  description = "A list of IP addresses to allow to connect to the cluster."
  type        = list(string)
  default     = null
}

variable "max_default_node_count" {
  description = "(Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = 2
}

variable "min_default_node_count" {
  description = "(Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = 2
}

variable "default_node_pool" {
  description = "Node Pool"
  type        = map
  default     = null
}
variable "node_resource_group" {
  description = "(Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "node_pool_name" {
  description = "The default Azure AKS nodepool name."
  type        = string
  default     = "default"
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Network policy to use for networking."
  type        = string
  default     = "calico"
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  type        = string
  default     = ""
}

variable "node_count" {
  description = "The number of Nodes that should exist in the Pool. Please set `node_count` `null` while `enable_auto_scaling` is `true` to avoid possible `node_count` changes."
  type        = number
  default     = null
}

variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = true
}

variable "system_only" {
  description = "(Optional) Enabling this option will taint default node pool with CriticalAddonsOnly=true:NoSchedule taint."
  type        = bool
  default     = false
}

variable "oms_agent_enabled" {
  description = "Deploy the OMS Agent to this Kubernetes Cluster"
  type        = bool
  default     = true
}

# variable "log_analytics_resource_group" {
#   description = "The resource group name of the Analytics workspace"
#   type        = string
#   default     = null
# }

variable "log_retention_in_days" {
  description = "The retention period for the logs in days. The expected value should be between 30 to 730"
  type        = number
  default     = 30
}

variable "create_ingress" {
  description = "Deploy the Application Gateway ingress controller to this Kubernetes Cluster"
  type        = bool
  default     = true
}

variable "gateway_id" {
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "load_balancer_sku" {
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. Defaults to Standard."
  type        = string
  default     = "Standard"
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}

variable "os_disk_type" {
  description = "The type of disk which should be used for the Operating System."
  type        = string
  default     = "Ephemeral"
}

variable "enable_role_based_access_control" {
  description = "Enable Role Based Access Control."
  type        = bool
  default     = true
}

variable "rbac_aad_managed" {
  description = "Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration."
  type        = bool
  default     = false
}

variable "azure_rbac_enabled" {
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
  type        = bool
  default     = false
}

variable "rbac_aad_admin_group" {
  description = "List of groups with admin access."
  type        = list(string)
  default     = []
}

variable "windows_node_pool_enabled" {
  description = "Enable Windows node pool"
  type        = bool
  default     = false
}

variable "windows_pool_name" {
  description = "The name of the Windows node Pool (A Windows Node Pool cannot have a name longer than 6 characters.)"
  type        = string
  default     = "wpool"
}

variable "windows_vm_size" {
  description = "The size of the Windows Virtual Machine, such as Standard_D2s_V4"
  type        = string
  default     = "Standard_D2ds_v4"
}

variable "windows_node_count" {
  description = "The number of Nodes that should exist in the Pool. Please set `node_count` `null` while `enable_auto_scaling` is `true` to avoid possible `node_count` changes."
  type        = number
  default     = null
}

variable "windows_os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}

variable "windows_os_disk_type" {
  description = "The type of disk which should be used for the Operating System."
  type        = string
  default     = "Ephemeral"
}

variable "enable_windows_auto_scaling" {
  description = "Enable Windows node pool autoscaling"
  type        = bool
  default     = false
}

variable "max_default_windows_node_count" {
  description = "(Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "min_default_windows_node_count" {
  description = "(Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "max_default_pod_count" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = 30
}

variable "max_default_windows_pod_count" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = 10
}


variable "system_node_pool_enabled" {
  description = "Enable System node pool"
  type        = bool
  default     = false
}

variable "system_pool_name" {
  description = "The name of the System node Pool (A System Node Pool cannot have a name longer than 6 characters.)"
  type        = string
  default     = "wpool"
}

variable "system_vm_size" {
  description = "The size of the System Virtual Machine, such as Standard_D2s_V4"
  type        = string
  default     = "Standard_D2ds_v4"
}

variable "system_node_count" {
  description = "The number of Nodes that should exist in the Pool. Please set `node_count` `null` while `enable_auto_scaling` is `true` to avoid possible `node_count` changes."
  type        = number
  default     = null
}

variable "system_os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}


variable "system_os_disk_type" {
  description = "The type of disk which should be used for the Operating System."
  type        = string
  default     = "Ephemeral"
}

variable "enable_system_auto_scaling" {
  description = "Enable System node pool autoscaling"
  type        = bool
  default     = false
}

variable "max_default_system_node_count" {
  description = "(Required) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "min_default_system_node_count" {
  description = "(Required) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  type        = number
  default     = null
}

variable "max_default_system_pod_count" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}