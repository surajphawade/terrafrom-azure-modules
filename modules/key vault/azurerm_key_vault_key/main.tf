resource "azurerm_key_vault_key" "this" {
  name         = var.name
  key_vault_id = var.key_vault_id
  key_type     = var.key_type
  key_size     = var.key_size

  key_opts = var.key_opts
 tags = var.tags
  rotation_policy {
    automatic {
      time_before_expiry = var.time_before_expiry
    }

    expire_after         = var.expiration_date
    notify_before_expiry = var.notify_before_date
  }
}