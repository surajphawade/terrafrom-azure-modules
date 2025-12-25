

---

## 📄 `modules/network/network-interface/README.md`

````md
# Network Interface Module

Creates an Azure Network Interface (NIC) that can be attached to
Virtual Machines or other compute resources.

This module is intentionally designed to be **simple, generic, and reusable**.
It focuses only on creating a network interface and assigning it to a subnet.
Advanced configurations such as multiple IP configurations, public IP
association, or NSG attachment can be added later as optional enhancements.

---

## Usage

```hcl
module "nic" {
  source = ".../modules/network/network-interface"

  name                = "demo-dev-nic"
  location            = "canadacentral"
  resource_group_name = "demo-dev-rg"
  subnet_id           = module.vm_subnet.subnet_id

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                | Type        | Required | Description                             |
| ------------------- | ----------- | -------- | --------------------------------------- |
| name                | string      | yes      | Network Interface name                  |
| location            | string      | yes      | Azure region                            |
| resource_group_name | string      | yes      | Resource group name                     |
| subnet_id           | string      | yes      | Subnet ID where the NIC will be created |
| tags                | map(string) | no       | Tags to apply to the NIC                |
| ip_configuration    | string      | yes      | IP Configuration Name                   |
---

## Outputs

* network_interface_id
* network_interface_name

---

## Supported Use Cases

This Network Interface module can be used for:

* Virtual Machines
* Jumpbox / Bastion-connected VMs
* Backend application servers
* Any compute resource requiring a private network interface

Public IPs, NSG associations, and multiple IP configurations are intentionally
excluded from the initial version to keep the module easy to consume.

---

## Notes

* This module creates a NIC with a **single private IP configuration**.
* The subnet must already exist before creating the network interface.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---

