
---

## 📄 `modules/network/subnet/README.md`

````md
# Subnet Module

Creates an Azure Subnet inside an existing Virtual Network.
This module is intentionally kept **simple and generic** so it can be reused
across multiple use cases such as Virtual Machines, App Services, AKS,
Private Endpoints, etc.

Advanced features (like delegation, service endpoints, NSG association)
are intentionally **not included** in the initial version to keep the module
easy to understand and widely usable. These can be added later as optional
enhancements without breaking existing projects.

---

## Usage

```hcl
module "subnet" {
  source = ".../modules/network/subnet"

  name                 = "demo-dev-subnet"
  resource_group_name  = "demo-dev-rg"
  virtual_network_name = "demo-dev-vnet"
  address_prefixes     = ["10.0.1.0/24"]
}
````

---

## Inputs

| Name                 | Type         | Required | Description                          |
| -------------------- | ------------ | -------- | ------------------------------------ |
| name                 | string       | yes      | Name of the subnet                   |
| resource_group_name  | string       | yes      | Resource group where the VNet exists |
| virtual_network_name | string       | yes      | Name of the virtual network          |
| address_prefixes     | list(string) | yes      | CIDR ranges for the subnet           |

---

## Outputs

* subnet_name
* subnet_id

---

## Supported Use Cases

This subnet module can be used for:

* Virtual Machines
* Azure App Services (VNet Integration)
* Azure Kubernetes Service (AKS)
* Private Endpoints
* Bastion / Jumpbox subnets

The behavior of the subnet depends on **how it is consumed by the project**
and **what resources are attached to it**, not on the subnet module itself.

---

## Notes

* This module assumes the Virtual Network already exists.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**: it only creates a subnet.

---
