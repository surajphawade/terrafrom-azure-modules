


---

## 📄 `modules/security/key-vault-key/README.md`

````md
# Key Vault Key Module

Creates an Azure Key Vault Key within an existing Key Vault.

This module is designed to be **generic and reusable**, focusing only on
Key Vault key creation. The Key Vault and access control must already
exist and should be managed using separate modules.

Secrets, certificates, and access policies are intentionally
excluded to maintain clear separation of responsibilities.

---

## Usage

### Basic Key Vault Key

```hcl
module "key_vault_key" {
  source = ".../modules/security/key-vault-key"

  name         = "demo-dev-key"
  key_vault_id = module.key_vault.key_vault_id
  key_type     = "RSA"
  key_size     = 2048
  key_ops = [
    "encrypt",
    "decrypt",
    "wrapKey",
    "unwrapKey"
  ]
}
````

---

## Inputs

| Name            | Type         | Required | Description                       |
| --------------- | ------------ | -------- | --------------------------------- |
| name            | string       | yes      | Key name                          |
| key_vault_id    | string       | yes      | ID of the Key Vault               |
| key_type        | string       | yes      | Key type (`RSA`, `EC`, `RSA-HSM`) |
| key_size        | number       | no       | Key size (for RSA keys)           |
| key_opts        | list(string) | no       | Allowed key operations            |
| notify_before_date | string    | no       | Key activation date               |
| expiration_date | string       | no       | Key expiration date               |
| time_before_expiry | string    | no       | Time Before expiry                |
| tags            | map(string)  | no       | Tags applied to the key           |

---

## Outputs

* key_vault_key_id
* key_vault_key_name

---

## Supported Use Cases

This Key Vault Key module can be used for:

* Encryption and decryption operations
* Disk encryption (CMK)
* Application-level encryption
* Secure key storage
* Compliance and regulatory requirements

Key lifecycle and permissions are controlled independently
through access policy or RBAC configuration.

---

## Notes

* The Key Vault must already exist.
* Appropriate access policies must be configured before creating keys.
* This module creates **only the Key Vault key**.
* Key rotation and version management should be handled separately.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
