variable "custom_providers" {
  description = <<EOT
Map of custom_providers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - action (block):
        - endpoint (required)
        - name (required)
    - resource_type (block):
        - endpoint (required)
        - name (required)
        - routing_type (optional)
    - validation (block):
        - specification (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    action = optional(list(object({
      endpoint = string
      name     = string
    })))
    resource_type = optional(list(object({
      endpoint     = string
      name         = string
      routing_type = optional(string)
    })))
    validation = optional(list(object({
      specification = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.custom_providers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.custom_providers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.custom_providers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.custom_providers : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

