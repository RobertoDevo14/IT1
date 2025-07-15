output "workspace_name" {
  value = azurerm_synapse_workspace.synapse.name
}

output "workspace_id" {
  value = azurerm_synapse_workspace.synapse.id
}
output "synapse_container_id" {
  value = azurerm_storage_container.synapse_container.id
}
output "datalake_url" {
  value = local.datalake_url
}
