variable "name" {
  description = "Bastion host name"
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

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for Azure Bastion (AzureBastionSubnet)"
  type = string
}
variable "pip_id" {
  description = "Public Ip ID for Azure Bastion "
  type = string
}

variable "tags" {
  description = "Tags to apply to the Bastion Host "
  type        = map(string)
}