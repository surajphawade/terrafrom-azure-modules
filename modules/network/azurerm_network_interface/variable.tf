variable "name" {
    description = "Network Interface name"
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
variable "subnet_id" {
    description = "Subnet ID where the NIC will be created"
    type = string
  
}
variable "ip_conf_name" {
    description = "Ip Configuration name"
    type = string
  
}
variable "tags" {
  description = "Tags to apply to the NIC"
  type = map(string)
}