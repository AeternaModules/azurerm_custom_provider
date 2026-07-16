output "custom_providers_id" {
  description = "Map of id values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "custom_providers_action" {
  description = "Map of action values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.action if v.action != null && length(v.action) > 0 }
}
output "custom_providers_location" {
  description = "Map of location values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.location if v.location != null && length(v.location) > 0 }
}
output "custom_providers_name" {
  description = "Map of name values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "custom_providers_resource_group_name" {
  description = "Map of resource_group_name values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "custom_providers_resource_type" {
  description = "Map of resource_type values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.resource_type if v.resource_type != null && length(v.resource_type) > 0 }
}
output "custom_providers_tags" {
  description = "Map of tags values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "custom_providers_validation" {
  description = "Map of validation values across all custom_providers, keyed the same as var.custom_providers"
  value       = { for k, v in azurerm_custom_provider.custom_providers : k => v.validation if v.validation != null && length(v.validation) > 0 }
}

