variable "name" {
    description = "Public IP name"
    type = string
  
}
variable "location" {
    description = "Azure region"
    type = string
  
}

variable "rg_name" {
  description = "Resource group name"
  type = string
}

variable "tags" {
  description = "Tags to apply to the Public IP"
  type = map(string)
}
