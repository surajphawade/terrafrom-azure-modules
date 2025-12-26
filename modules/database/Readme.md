

---

## 📄 `modules/database/mysql-server/README.md`

````md
# MySQL Server Module

Creates an Azure MySQL Server.

This module is designed to be **generic and reusable**, focusing only on
MySQL Server creation. Networking configuration, firewall rules,
databases, users, and private endpoints are intentionally managed
through separate modules to maintain clear separation of responsibilities.

---

## Usage

### Basic MySQL Server

```hcl
module "mysql_server" {
  source = ".../modules/database/mysql-server"

  name                = "demo-dev-mysql"
  resource_group_name = "demo-dev-rg"
  location            = "canadacentral"

  administrator_login          = "mysqladmin"
  administrator_login_password = var.mysql_admin_password

  sku_name = "B_Gen5_2"
  version  = "5.7"

  storage_mb            = 5120
  backup_retention_days = 7
  geo_redundant_backup  = "Disabled"

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                         | Type        | Required | Description                        |
| ---------------------------- | ----------- | -------- | ---------------------------------- |
| name                         | string      | yes      | MySQL Server name                  |
| resource_group_name          | string      | yes      | Resource group name                |
| location                     | string      | yes      | Azure region                       |
| administrator_login          | string      | yes      | Administrator username             |
| administrator_login_password | string      | yes      | Administrator password (sensitive) |
| sku_name                     | string      | yes      | MySQL SKU name                     |
| version                      | string      | yes      | MySQL version                      |
| storage_mb                   | number      | no       | Storage size in MB                 |
| backup_retention_days        | number      | no       | Backup retention period (days)     |
| geo_redundant_backup         | string      | no       | Enable geo-redundant backup        |
| ssl_enforcement_enabled      | bool        | no       | Enforce SSL connections            |
| tags                         | map(string) | no       | Tags applied to the MySQL Server   |

---

## Outputs

* mysql_server_name
* mysql_server_id
* mysql_server_fqdn

---

## Supported Use Cases

This MySQL Server module can be used for:

* Application databases
* Backend services
* Development and test environments
* Shared database platforms
* Environment-specific MySQL deployments

Databases, firewall rules, users, and networking controls
should be managed separately.

---

## Notes

* MySQL Server name must be globally unique.
* This module creates **only the MySQL Server resource**.
* Database creation and access control are intentionally excluded.
* Admin credentials should be supplied securely (e.g., via Key Vault).
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
