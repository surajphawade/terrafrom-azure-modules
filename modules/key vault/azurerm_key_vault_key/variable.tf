variable "name" {
  description = "Key name "
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "key_type" {
  description = "Key type (`RSA`, `EC`)"
  type        = string
}
variable "key_size" {
  description = "Key size (for RSA keys)"
  type        = number
}

variable "key_opts" {
  description = "Allowed key operations"
  type        = list(string)
}

variable "notify_before_date" {
  description = "Key activation date"
  type        = string
}

variable "expiration_date" {
  description = "Key expiration date"
  type        = string
}

variable "time_before_expiry" {
  description = "Time before expiry"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the Bastion Host "
  type        = map(string)
}