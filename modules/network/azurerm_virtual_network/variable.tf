variable "name" {
  description = "Virtual Network Name"
  type        = string
}

variable "rg_name" {
  description = "Resource group where VNet will be created"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type = list(string)
}

variable "tags" {
  description = "Tags to apply to the VNet"
  type        = map(string)
  default     = {}
}