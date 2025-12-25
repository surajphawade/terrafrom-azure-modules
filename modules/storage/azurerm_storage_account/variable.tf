variable "name" {
  description = "Storage Account name"
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

variable "account_tier" {
  description = "Storage account tier (Standard / Premium)"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type (LRS, GRS, RAGRS, ZRS)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Stg"
  type        = map(string)
  default     = {}
}
