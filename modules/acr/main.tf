locals {
  roles_map           = { for role in var.roles : "${role.ppal_id}.${role.role}" => role }
}

resource "azurerm_container_registry" "acr" {
  name                      = var.acr_name
  resource_group_name       = var.rsg_name
  location                  = var.location
  sku                       = var.sku
  admin_enabled             = var.admin_enabled
  quarantine_policy_enabled = var.sku == "Premium" ? var.quarantine_policy_enabled : false
  #System  Managed Identity generated or User Managed Identity ID's which should be assigned to the Container Registry.
  # identity {
  #   type = "SystemAssigned, UserAssigned"
  #   identity_ids = [
  #     var.identity_id
  #   ]
  # }

  trust_policy {
    enabled = var.content_trust
  }

  dynamic "georeplications" {
    for_each = var.sku == "Premium" ? ["georeplica_activated"] : []
    content {
      location = var.georeplication_location
    }
  }

  dynamic "retention_policy" {
    for_each = var.sku == "Premium" ? ["retention_policy_activated"] : []
    content {
      days    = var.retention_policy["days"]
      enabled = var.retention_policy["enabled"]
    }
  }

  dynamic "encryption" {
    for_each = var.encryption.enabled == true && var.encryption.key_vault_key_id != null && var.encryption.identity_client_id != null ? ["encryption_activated"] : []
    content {
      enabled            = var.content_trust == true ? false : var.encryption.enabled
      key_vault_key_id   = var.encryption.key_vault_key_id
      identity_client_id = var.encryption.identity_client_id
    }
  }
}

resource "azurerm_role_assignment" "roles" {
  for_each = local.roles_map

  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = each.value.principal_id

}