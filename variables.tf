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
    action = optional(object({
      endpoint = string
      name     = string
    }))
    resource_type = optional(object({
      endpoint     = string
      name         = string
      routing_type = optional(string, "Proxy")
    }))
    validation = optional(object({
      specification = string
    }))
  }))
}

