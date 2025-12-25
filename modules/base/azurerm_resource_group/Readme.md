# Resource Group Module

Creates an Azure Resource Group with standardized tagging.

## Usage
```
module "rg" {
source = ".../modules/security/resource-group"

name = "demo-dev-rg"
location = "canadacentral"
tags = {
env = "dev"
owner = "platform"}
}
```


## Inputs

| Name     | Type   | Required |
|----------|--------|----------|
| name     | string | yes      |
| location | string | yes      |
| tags     | map    | no       |

## Outputs
- resource_group_name
- resource_group_id
