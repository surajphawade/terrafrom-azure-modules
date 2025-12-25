

---

## 📄 `modules/network/network-security-group/README.md`

````md
# Network Security Group (NSG) Module

Creates an Azure Network Security Group (NSG) and dynamically configures
security rules based on input variables.

This module is designed to be **data-driven and reusable**, allowing
project teams to define different security rules via `terraform.tfvars`
without modifying Terraform code.

---

## Usage

### Basic NSG with Rules

```hcl
module "nsg" {
  source = ".../modules/network/network-security-group"

  name     = "demo-dev-nsg"
  rg_name  = "demo-dev-rg"
  location = "canadacentral"

  security_rules = [
    {
      name                       = "allow-ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]

  tags = {
    env   = "dev"
    owner = "platform"
  }
}
````

---

## Inputs

| Name           | Type         | Required | Description                 |
| -------------- | ------------ | -------- | --------------------------- |
| name           | string       | yes      | Network Security Group name |
| rg_name        | string       | yes      | Resource group name         |
| location       | string       | yes      | Azure region                |
| security_rules | list(object) | no       | List of NSG security rules  |
| tags           | map(string)  | no       | Tags applied to the NSG     |

---

## Security Rules Input Format

Each security rule must follow this structure:

```hcl
{
  name                       = string
  priority                   = number
  direction                  = string   # Inbound / Outbound
  access                     = string   # Allow / Deny
  protocol                   = string   # Tcp / Udp / *
  source_port_range          = string
  destination_port_range     = string
  source_address_prefix      = string
  destination_address_prefix = string
}
```

* Rules are created dynamically using `for_each`
* Rule names must be unique within the NSG
* Priority values must be unique per NSG

---

## Outputs

* network_security_group_name
* network_security_group_id

---

## Supported Use Cases

This NSG module can be used for:

* VM-level security (via NIC association)
* Subnet-level security
* Different rule sets per workload
* Multi-VM and multi-environment projects

Each project can define its own security rules using `terraform.tfvars`
without changing the module code.

---

## Notes

* This module **creates only the NSG and its rules**.
* Subnet or NIC association must be handled separately.
* Provider and backend configuration must be defined in the project repository.
* Inline `security_rule` blocks are intentionally avoided for scalability.
* Empty `security_rules` list results in an NSG with no custom rules.

---
