

---

## 📄 `modules/security/key-vault/README.md`

````md
# Key Vault Module

Creates an Azure Key Vault.

This module is designed to be **generic and reusable**, focusing only on
Key Vault creation. Access policies, keys, secrets, certificates,
network rules, and private endpoints are intentionally managed through
separate modules to ensure clear separation of responsibilities.

---

## Usage

### Basic Key Vault

```hcl
module "key_vault" {
  source = ".../modules/security/key-vault"

  name                = "demo-dev-kv"
  resource_group_name = "demo-dev-rg"
  location            = "canadacentral"
  tenant_id           = var.tenant_id
  sku_name            = "standard"

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                       | Type        | Required | Description                            |
| -------------------------- | ----------- | -------- | -------------------------------------- |
| name                       | string      | yes      | Key Vault name                         |
| resource_group_name        | string      | yes      | Resource group name                    |
| location                   | string      | yes      | Azure region                           |
| tenant_id                  | string      | yes      | Azure AD tenant ID                     |
| sku_name                   | string      | yes      | Key Vault SKU (`standard` / `premium`) |
| soft_delete_retention_days | number      | no       | Soft delete retention period (days)    |
| purge_protection_enabled   | bool        | no       | Enable purge protection                |
| tags                       | map(string) | no       | Tags applied to the Key Vault          |

---

## Outputs

* key_vault_name
* key_vault_id
* key_vault_uri

---

## Supported Use Cases

This Key Vault module can be used for:

* Centralized secrets management
* Encryption key storage
* Secure application configuration
* Shared platform Key Vaults
* Environment-specific Key Vault deployments

Access control and data objects are managed separately to keep
the Key Vault resource clean and reusable.

---

## Notes

* Key Vault name must be globally unique.
* This module creates **only the Key Vault resource**.
* Access policies, RBAC, keys, secrets, certificates, network rules,
  and private endpoints are intentionally excluded.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
