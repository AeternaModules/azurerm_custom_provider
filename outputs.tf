output "custom_providers" {
  description = "All custom_provider resources"
  value       = azurerm_custom_provider.custom_providers
}
output "custom_providers_action" {
  description = "List of action values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.action]
}
output "custom_providers_location" {
  description = "List of location values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.location]
}
output "custom_providers_name" {
  description = "List of name values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.name]
}
output "custom_providers_resource_group_name" {
  description = "List of resource_group_name values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.resource_group_name]
}
output "custom_providers_resource_type" {
  description = "List of resource_type values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.resource_type]
}
output "custom_providers_tags" {
  description = "List of tags values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.tags]
}
output "custom_providers_validation" {
  description = "List of validation values across all custom_providers"
  value       = [for k, v in azurerm_custom_provider.custom_providers : v.validation]
}

