output "key_vault_key_id" {
  value = azurerm_key_vault_key.this.id
}

output "key_vault_key_name" {
  value = azurerm_key_vault_key.this.name
}