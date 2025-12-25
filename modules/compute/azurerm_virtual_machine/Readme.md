

---

## 📄 `modules/compute/virtual-machine/README.md`

````md
# Virtual Machine (VM) Module

Creates an Azure Linux Virtual Machine using existing networking resources.

This module is designed to be **generic and reusable**, focusing only on
Virtual Machine creation. Networking, security, and supporting resources
such as NICs, Subnets, NSGs, and Resource Groups are expected to be created
outside this module and passed in as inputs.

---

## Usage

### Basic VM

```hcl
module "vm" {
  source = ".../modules/compute/virtual-machine"

  name                = "demo-dev-vm"
  resource_group_name = "demo-dev-rg"
  location            = "canadacentral"
  vm_size             = "Standard_B2s"

  network_interface_ids = [
    module.nic.network_interface_id
  ]

  admin_username = "azureuser"
  admin_password = var.admin_password

  image = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                  | Type         | Required | Description                              |
| --------------------- | ------------ | -------- | ---------------------------------------- |
| name                  | string       | yes      | Virtual Machine name                     |
| resource_group_name   | string       | yes      | Resource group name                      |
| location              | string       | yes      | Azure region                             |
| vm_size               | string       | yes      | Virtual Machine size                     |
| network_interface_ids | list(string) | yes      | Network Interface IDs attached to the VM |
| admin_username        | string       | yes      | Admin username                           |
| admin_password        | string       | yes      | Admin password (sensitive)               |
| image                 | object       | yes      | Source image reference                   |
| tags                  | map(string)  | no       | Tags applied to the VM                   |

---

## Image Input Format

The image reference must follow this structure:

```hcl
{
  publisher = string
  offer     = string
  sku       = string
  version   = string
}
```

---

## Outputs

* virtual_machine_name
* virtual_machine_id

---

## Supported Use Cases

This Virtual Machine module can be used for:

* Application servers
* Backend services
* Jumpbox / utility VMs
* Development and test environments
* Multi-VM deployments driven from root modules

Networking and security controls are applied externally using NIC,
Subnet, and NSG modules.

---

## Notes

* This module supports password-based authentication.
* Admin credentials should be supplied securely (e.g., via Key Vault at the project level).
* The module supports one or more network interfaces; most VMs typically use a single NIC.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
