variable "tenant_id" {
  description = "Tenant ID for the UK platform subscription"
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID for the UK platform subscription"
  type        = string
}

variable "naming" {
  description = "Naming convention settings"
  type = object({
    prefix    = string
    delimiter = string
  })
}

variable "product" {
  description = "Product name (e.g., platform)"
  type        = string
}

variable "env" {
  description = "Environment (e.g., prod)"
  type        = string
}

variable "location" {
  description = "Azure region for deployment (e.g., uksouth)"
  type        = string
}

variable "region_short_map" {
  description = "Map of region names to short codes"
  type        = map(string)
}

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}
