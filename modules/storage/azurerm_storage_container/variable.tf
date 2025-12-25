variable "name" {
  description = "Storage container name "
  type        = string
}

variable "stg_name" {
  description = "Name of the storage account"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "container_access_type" {
  description = "Access level (`private`, `blob`, `container`)"
  type        = string
}