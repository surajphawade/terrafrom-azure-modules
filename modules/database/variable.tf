variable "name" {
  description = "Secret name "
  type        = string
}

variable "location" {
    description = "Azure region"
  type = string
}

variable "rg_name" {
    description = "Resource group name "
  type = string
}


variable "admin_login" {
    description = "Administrator username "
  type = string
}

variable "admin_password" {
  description = "Administrator password (sensitive)"
  type        = string
  sensitive   = true
}