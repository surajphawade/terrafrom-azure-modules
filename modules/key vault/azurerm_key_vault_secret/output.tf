output "key_vault_secret_id" {
    value = azurerm_key_vault_secret.this.id
  
}

output "key_vault_secret_name" {
    value = azurerm_key_vault_secret.this.name
  
}