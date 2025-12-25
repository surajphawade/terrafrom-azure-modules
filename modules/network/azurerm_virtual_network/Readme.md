
---

## 📄 `modules/network/virtual-network/README.md`

```
# Virtual Network Module

Creates an Azure Virtual Network with standardized naming and tagging.
This module is intended to be consumed by project-level Terraform repositories
via the centralized Terraform module registry.

---

## Usage

```hcl
module "vnet" {
  source = ".../modules/network/virtual-network"

  name                = "demo-dev-vnet"
  resource_group_name = "demo-dev-rg"
  location            = "canadacentral"
  address_space       = ["10.0.0.0/16"]

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                | Type         | Required | Description                               |
| ------------------- | ------------ | -------- | ----------------------------------------- |
| name                | string       | yes      | Virtual Network name                      |
| resource_group_name | string       | yes      | Resource group where VNet will be created |
| location            | string       | yes      | Azure region                              |
| address_space       | list(string) | yes      | Address space for the VNet                |
| tags                | map(string)  | no       | Tags to apply to the VNet                 |

---

## Outputs

* vnet_name
* vnet_id
* vnet_address_space

---

## Notes

* This module does **not** create subnets.
* Subnets should be created using a separate subnet module.
* Provider and backend configuration must be defined in the project repository.

```


