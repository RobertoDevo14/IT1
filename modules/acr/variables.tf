variable "location" {
}

#-------------------------------
# ACR Variables
#-------------------------------

variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry."
  default     = ""
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "The SKU name of the container registry."

  validation {
    condition     = contains(["Basic", "Standard ", "Premium"], var.sku)
    error_message = "ERROR: Invalid SKU Tier must be one of Basic, Standard or Premium."
  }
}

variable "rsg_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "encryption_enabled" {
  type        = bool
  description = "Specifies whether the encryption use option is enabled."
  default     = true
}

variable "identity_id" {
  type        = string
  description = "The user assigned identity ID of the managed identity associated with the encryption key."
  default     = null
}

variable "admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = bool
  default     = false
}

variable "quarantine_policy_enabled" {
  description = "Indicates whether quarantine policy is enabled."
  type        = bool
  default     = false
}

variable "retention_policy" {
  type        = map(string)
  description = "If enabled define the numebr of days to retain an untagged manifest after which it gets purged"
  default = {
    days    = 7
    enabled = false
  }
}

variable "id_aks_ppl"{
  default = ""
}
variable "encryption" {
  description = "Specifies whether the encryption user option is enabled. When enabled, the client ID of the managed identity associated with the encryption key has to be specified."
  type = object({
    enabled            = bool
    key_vault_key_id   = string
    identity_client_id = string
  })
  default = {
    enabled            = false
    key_vault_key_id   = null
    identity_client_id = null
  }
}

variable "roles" {
  description = "List of roles that should be assigned to sppal."
  type        = list(object({ ppal_id = string, role = string }))
  default     = []
}

variable "content_trust" {
  description = "Enable Docker Content Trust on ACR."
  type        = bool
  default     = false
}

variable "georeplication_location" {
  description = "The Azure location where the container registry should be geo-replicated (sku must be Premium)."
  type        = string
  default     = "West Europe"
}

# variable "tags" {
#   description = "A map of tags to add to all resources"
#   type        = map(string)
#   default     = {}
# }