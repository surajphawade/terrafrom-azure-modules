


---

## 📄 `modules/network/public-ip/README.md`

````md
# Public IP Module

Creates an Azure Public IP address that can be associated with
resources such as Virtual Machines, Bastion Hosts, Load Balancers,
or Application Gateways.

This module is intentionally designed to be **simple, generic, and reusable**.
It focuses only on creating a Public IP resource with safe defaults.
Advanced configurations such as zone redundancy or DNS labels can be
added later as optional enhancements.

---

## Usage

```hcl
module "public_ip" {
  source = ".../modules/network/public-ip"

  name                = "demo-dev-pip"
  location            = "canadacentral"
  resource_group_name = "demo-dev-rg"

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name                | Type        | Required | Description                    |
| ------------------- | ----------- | -------- | ------------------------------ |
| name                | string      | yes      | Public IP name                 |
| location            | string      | yes      | Azure region                   |
| resource_group_name | string      | yes      | Resource group name            |
| tags                | map(string) | no       | Tags to apply to the Public IP |

---

## Outputs

* public_ip_id
* public_ip_address

---

## Supported Use Cases

This Public IP module can be used for:

* Azure Bastion
* Virtual Machines (when required)
* Load Balancers
* Application Gateways
* Other Azure services requiring a Public IP

The actual usage and association of the Public IP is handled
by the consuming project or module.

---

## Notes

* This module creates a **Standard SKU**, **Static** Public IP by default.
* The Public IP is created independently and can be reused across modules.
* Provider and backend configuration must be defined in the project repository.
* This module follows the **single-responsibility principle**.

---
