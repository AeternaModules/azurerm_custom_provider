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
  # --- Unconfirmed validation candidates, derived from azurerm_custom_provider's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.CustomProviderName] regexp.MustCompile(`^[\s]+$`).MatchString(name)
  # path: name
  #   source:    [from validate.CustomProviderName] !regexp.MustCompile(`^[a-zA-Z0-9_]+$`).MatchString(name)
  # path: name
  #   source:    [from validate.CustomProviderName] len(name) < 3 || len(name) > 63
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: resource_type.name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: resource_type.endpoint
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: resource_type.routing_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: action.name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: action.endpoint
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: validation.specification
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

