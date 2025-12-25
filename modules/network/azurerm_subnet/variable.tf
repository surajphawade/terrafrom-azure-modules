variable "name" {
  description = "Name of the subnet "
  type        = string
}

variable "rg_name" {
  description = "Resource group where the VNet exists"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_prefix" {
  description = "CIDR ranges for the subnet"
  type        = list(string)
}