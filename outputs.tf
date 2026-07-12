output "custom_providers_id" {
  description = "Map of id values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.id }
}
output "custom_providers_action" {
  description = "Map of action values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.action }
}
output "custom_providers_location" {
  description = "Map of location values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.location }
}
output "custom_providers_name" {
  description = "Map of name values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.name }
}
output "custom_providers_resource_group_name" {
  description = "Map of resource_group_name values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.resource_group_name }
}
output "custom_providers_resource_type" {
  description = "Map of resource_type values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.resource_type }
}
output "custom_providers_tags" {
  description = "Map of tags values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.tags }
}
output "custom_providers_validation" {
  description = "Map of validation values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.validation }
}

