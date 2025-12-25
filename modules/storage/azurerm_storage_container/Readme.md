
---

## 📄 `modules/storage/storage-container/README.md`

````md
# Storage Container Module

Creates an Azure Storage Container within an existing Storage Account.

This module is designed to be **generic and reusable**, focusing only on
Storage Container creation. The Storage Account must already exist and
is expected to be managed by a separate module.

---

## Usage

### Basic Storage Container

```hcl
module "storage_container" {
  source = ".../modules/storage/storage-container"

  name                  = "vhds"
  storage_account_name  = "demodevstorage01"
  resource_group_name   = "demo-dev-rg"
  container_access_type = "private"
}
````

---

## Inputs

| Name                  | Type   | Required | Description                                   |
| --------------------- | ------ | -------- | --------------------------------------------- |
| name                  | string | yes      | Storage container name                        |
| storage_account_name  | string | yes      | Name of the storage account                   |
| resource_group_name   | string | yes      | Resource group name                           |
| container_access_type | string | no       | Access level (`private`, `blob`, `container`) |

---

## Outputs

* storage_container_name
* storage_container_id

---

## Supported Use Cases

This Storage Container module can be used for:

* VM disk containers
* Application data storage
* Backup and archive containers
* Terraform state storage
* Log and diagnostic data

Access level is controlled using `container_access_type` based on
security and application requirements.

---

## Notes

* The storage account must exist before creating the container.
* Container names must be lowercase.
* This module creates **only the storage container**.
* Access control, lifecycle policies, and encryption are managed
  at the storage account level.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
