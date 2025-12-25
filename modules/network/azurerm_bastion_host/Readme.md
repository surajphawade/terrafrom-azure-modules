
---

## 📄 `modules/network/bastion-host/README.md`

````md
# Bastion Host Module

Creates an Azure Bastion Host to securely access Virtual Machines
without exposing them to the public internet.

This module is intentionally kept **simple and reusable** so that it can be
used across different projects and environments. Advanced networking or
security customizations can be added later without breaking existing usage.

---

## Usage

```hcl
module "bastion" {
  source = ".../modules/network/bastion-host"

  name                 = "demo-dev-bastion"
  resource_group_name  = "demo-dev-rg"
  location             = "canadacentral"
  virtual_network_name = "demo-dev-vnet"
  subnet_id            = module.bastion_subnet.subnet_id

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

> ⚠️ Azure Bastion **must be deployed in a subnet named `AzureBastionSubnet`**
> with a minimum address prefix of `/26`.

---

## Inputs

| Name                 | Type        | Required | Description                                      |
| -------------------- | ----------- | -------- | ------------------------------------------------ |
| name                 | string      | yes      | Bastion host name                                |
| resource_group_name  | string      | yes      | Resource group name                              |
| location             | string      | yes      | Azure region                                     |
| virtual_network_name | string      | yes      | Virtual network name                             |
| subnet_id            | string      | yes      | Subnet ID for Azure Bastion (AzureBastionSubnet) |
| tags                 | map(string) | no       | Tags to apply to the Bastion Host                |

---

## Outputs

* bastion_host_name
* bastion_host_id

---

## Supported Use Cases

This Bastion Host module is commonly used for:

* Secure access to Virtual Machines
* Eliminating public IPs on VMs
* Admin / jumpbox access patterns
* Enterprise environments with restricted inbound access

---

## Notes

* The subnet used **must be named `AzureBastionSubnet`**.
* The subnet must already exist before creating the Bastion Host.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**: it only creates a Bastion Host.

---
