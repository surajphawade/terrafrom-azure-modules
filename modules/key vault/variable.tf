variable "name" {
  description = "Key Vault name "
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID "
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU (`standard` / `premium`)"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention period (days)"
  type = number
}

variable "purge_protection_enabled" {
    description = "Enable purge protection"
    type = bool
  
}

variable "tags" {
  description = "Tags to apply to the Bastion Host "
  type        = map(string)
}