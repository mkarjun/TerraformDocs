# Terraform Modules

## Introduction
Modules are the cornerstone of reusable, scalable, and maintainable Terraform configurations. By encapsulating common patterns and abstracting complexity, modules allow teams to work more efficiently and consistently across environments.

> "Think of modules as blueprints for your infrastructure, enabling you to build with precision and reusability."

---

## Why Use Modules?
### Benefits of Modularization
- **Reusability**: Define once, use anywhere.
- **Maintainability**: Simplify updates by modifying the module rather than individual configurations.
- **Consistency**: Enforce standardized practices across teams and projects.
- **Collaboration**: Abstract complexity, making configurations easier for team members to understand and use.

---

## Anatomy of a Terraform Module
A module typically consists of the following:
1. **`main.tf`**: Contains the core resource definitions.
2. **`variables.tf`**: Defines input variables.
3. **`outputs.tf`**: Specifies output values to expose.
4. **Optional Files**:
   - `README.md`: Documents the module.
   - `providers.tf`: Declares required providers and versions.

### Example: Module Directory Structure
```
my-module/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
```

---

## Writing a Module
### Step 1: Define Resources in `main.tf`
For example, a module to create an AWS S3 bucket:

```hcl
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  acl    = var.acl
}
```

### Step 2: Declare Variables in `variables.tf`

```hcl
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Access control list"
  type        = string
  default     = "private"
}
```

### Step 3: Define Outputs in `outputs.tf`

```hcl
output "bucket_id" {
  value = aws_s3_bucket.example.id
}
```

### Step 4: Document the Module in `README.md`
Include details on usage, required inputs, and expected outputs.

---

## Using a Module
Modules can be used locally or from remote repositories.

### Using a Local Module
If your module is in a folder called `my-module`:

```hcl
module "s3" {
  source      = "./my-module"
  bucket_name = "my-example-bucket"
  acl         = "private"
}
```

### Using a Remote Module
Use modules from the Terraform Registry or a Git repository:

```hcl
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"
  cidr_block = "10.0.0.0/16"
}
```

---

## Advanced Module Features
### Module Composition
Modules can include other modules, enabling powerful compositions. For example:

```hcl
module "network" {
  source = "./modules/network"
  cidr_block = var.network_cidr
}

module "compute" {
  source = "./modules/compute"
  network_id = module.network.network_id
}
```

### Variable Validation
Add validation rules to ensure correct inputs:

```hcl
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string

  validation {
    condition     = length(var.bucket_name) <= 63
    error_message = "Bucket name must be 63 characters or less."
  }
}
```

### Conditional Logic
Use conditions to control resource creation:

```hcl
resource "aws_s3_bucket" "example" {
  count = var.create_bucket ? 1 : 0
  bucket = var.bucket_name
}
```

---

## Tryout Scenario
### Objective: Create an S3 Bucket Module
1. **Create the Module Directory**:
   ```
   mkdir my-s3-module
   cd my-s3-module
   ```

2. **Write the Files**:
   - `main.tf`:
     ```hcl
     resource "aws_s3_bucket" "example" {
       bucket = var.bucket_name
       acl    = var.acl
     }
     ```
   - `variables.tf`:
     ```hcl
     variable "bucket_name" {
       description = "Name of the S3 bucket"
       type        = string
     }

     variable "acl" {
       description = "Access control list"
       type        = string
       default     = "private"
     }
     ```
   - `outputs.tf`:
     ```hcl
     output "bucket_id" {
       value = aws_s3_bucket.example.id
     }
     ```

3. **Use the Module** in a Terraform Configuration:
   ```hcl
   module "my_s3" {
     source      = "./my-s3-module"
     bucket_name = "test-bucket"
     acl         = "public-read"
   }
   ```

4. **Run Commands**:
   ```bash
   terraform init
   terraform apply
   ```

5. **Verify the Results** in the AWS Management Console.

---

## Key Takeaways
- Modules encapsulate reusable logic for scalable configurations.
- They enhance collaboration, maintainability, and consistency across projects.
- Advanced features like composition and validation elevate Terraform's power.

---

## Next Steps
With modules mastered, explore advanced Terraform topics such as workspaces, remote state management, and infrastructure testing. These topics will prepare you for managing complex, multi-environment deployments.

**Let’s continue to build smarter and modularized infrastructure together!**
