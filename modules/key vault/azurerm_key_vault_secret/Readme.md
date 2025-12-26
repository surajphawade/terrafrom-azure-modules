
---

## 📄 `modules/security/key-vault-secret/README.md`

````md
# Key Vault Secret Module

Creates an Azure Key Vault Secret within an existing Key Vault.

This module is designed to be **generic and reusable**, focusing only on
secret creation and management inside a Key Vault. The Key Vault itself
and access control must already exist and should be managed using
separate modules.

Keys, certificates, and access policies are intentionally managed
independently to maintain clear separation of responsibilities.

---

## Usage

### Basic Key Vault Secret

```hcl
module "key_vault_secret" {
  source = ".../modules/security/key-vault-secret"

  name         = "secret-sauce"
  value        = var.secret_value
  key_vault_id = module.key_vault.key_vault_id
}
````

---

## Inputs

| Name         | Type        | Required | Description                |
| ------------ | ----------- | -------- | -------------------------- |
| name         | string      | yes      | Secret name                |
| value        | string      | yes      | Secret value               |
| key_vault_id | string      | yes      | ID of the Key Vault        |
| tags         | map(string) | no       | Tags applied to the secret |

---

## Outputs

* key_vault_secret_id
* key_vault_secret_name

---

## Supported Use Cases

This Key Vault Secret module can be used for:

* Application secrets and credentials
* Database passwords
* API keys
* Connection strings
* Secure configuration values

Secrets can be referenced securely by applications and services
using Key Vault access permissions.

---

## Notes

* The Key Vault must already exist.
* Appropriate access permissions must be configured before creating secrets.
* This module creates **only the Key Vault secret**.
* Secret values should be supplied securely (e.g., via variables or Key Vault references).
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
