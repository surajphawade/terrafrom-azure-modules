

## 📄 `modules/storage/storage-account/README.md`

````md
# Storage Account Module

Creates an Azure Storage Account with configurable settings.

This module is designed to be **generic and reusable**, focusing only on
Storage Account creation. Networking rules, private endpoints, containers,
file shares, and other dependent resources are expected to be managed
outside this module and attached as needed.

---

## Usage

### Basic Storage Account

```hcl
module "storage_account" {
  source = ".../modules/storage/storage-account"

  name                = "demodevstorage01"
  resource_group_name = "demo-dev-rg"
  location            = "canadacentral"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                      | Type        | Required | Description                               |
| ------------------------- | ----------- | -------- | ----------------------------------------- |
| name                      | string      | yes      | Storage Account name                      |
| resource_group_name       | string      | yes      | Resource group name                       |
| location                  | string      | yes      | Azure region                              |
| account_tier              | string      | yes      | Storage account tier (Standard / Premium) |
| account_replication_type  | string      | yes      | Replication type (LRS, GRS, RAGRS, ZRS)   |
| tags                      | map(string) | no       | Tags applied to the storage account       |

---

## Outputs

* storage_account_name
* storage_account_id


---

## Supported Use Cases

This Storage Account module can be used for:

* Blob storage
* File shares
* Backend storage for Terraform state
* Application data storage
* Diagnostics and logging

Advanced configurations such as private endpoints, firewall rules,
containers, and file shares should be managed separately.

---

## Notes

* Storage account name must be globally unique.
* This module creates only the Storage Account resource.
* Network rules and private endpoints are intentionally excluded.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---

