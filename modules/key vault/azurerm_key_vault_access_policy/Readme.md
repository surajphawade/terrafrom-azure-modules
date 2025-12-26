
---

## 📄 `modules/security/key-vault-access-policy/README.md`

````md
# Key Vault Access Policy Module

Creates an Azure Key Vault Access Policy for an existing Key Vault.

This module is designed to be **generic and reusable**, focusing only on
managing access policies for a Key Vault. The Key Vault itself must already
exist and should be created using a separate module.

Keys, secrets, and certificates are managed independently using
dedicated modules.

---

## Usage

### Basic Key Vault Access Policy

```hcl
module "key_vault_access_policy" {
  source = ".../modules/security/key-vault-access-policy"

  key_vault_id = module.key_vault.key_vault_id
  tenant_id    = var.tenant_id
  object_id    = var.object_id

  key_permissions = [
    "Get",
    "List"
  ]

  secret_permissions = [
    "Get",
    "List"
  ]

  certificate_permissions = [
    "Get",
    "List"
  ]
}
````

---

## Inputs

| Name                    | Type         | Required | Description                                   |
| ----------------------- | ------------ | -------- | --------------------------------------------- |
| key_vault_id            | string       | yes      | ID of the Key Vault                           |
| tenant_id               | string       | yes      | Azure AD tenant ID                            |
| object_id               | string       | yes      | Object ID (user, group, or service principal) |
| key_permissions         | list(string) | no       | Key permissions                               |
| secret_permissions      | list(string) | no       | Secret permissions                            |
| certificate_permissions | list(string) | no       | Certificate permissions                       |

---

## Outputs

* key_vault_access_policy_id

---

## Supported Use Cases

This Key Vault Access Policy module can be used for:

* Granting applications access to Key Vault secrets
* Assigning key permissions to service principals
* Managing user or group access to Key Vault
* Environment-specific access control

Multiple access policies can be applied to the same Key Vault
by invoking this module multiple times.

---

## Notes

* The Key Vault must already exist before applying an access policy.
* This module creates **only a single access policy**.
* Permissions must match supported Azure Key Vault permission values.
* RBAC-based access control is intentionally excluded.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
