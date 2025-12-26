
variable "key_vault_id" {
  description = "ID of the Key Vault "
  type        = string
}
variable "tenant_id" {
  description = "Azure AD tenant"
  type        = string
}
variable "object_id" {
  description = "Object ID (user, group, or service principal)"
  type        = string
}
variable "key_permissions" {
  description = "Key permissions"
  type        = list(string)
}
variable "secret_permissions" {
  description = "Secret permissions"
  type        = list(string)
}
variable "certificate_permissions" {
  description = "Certificate permissions"
  type        = list(string)
}

