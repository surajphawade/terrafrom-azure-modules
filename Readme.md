# Terraform Azure Modules

This repository contains reusable, production-grade Terraform modules
for provisioning Azure infrastructure.

## Purpose
- Provide standardized Terraform modules
- Enforce best practices
- Enable teams to Practice on build infrastructure consistently

## Available Modules

### Base
- resource-group

### Storage
- storage-account

## How to Use

Modules are consumed from **project-specific Terraform repositories**
using Git source references and version tags.

Example:
```
module "rg" {
source = "git::https://github.com/xyz/terraform-azure-modules.git//modules/security/resource-group?ref=v1.0.0"
}
```

## Versioning
This repository follows **Semantic Versioning**.
Refer to VERSIONING.md for details.