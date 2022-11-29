# **Terraform AWS Module for Glacier Vault**
This module can be used to create Glacier Vault.

### **Table of Contents**

- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
``` 
module "glacier" {
source = "./"
# add your inputs here...
}
```

## Examples

- [glacier-vault-basic-configuration](examples/glacier-vault/)
- [glacier-vault-with-custom-configuration](examples/glacier-vault-with-custom-configuration/)

### **Requirements**

| Name | Version |
| ------ | ------|
| terraform | 1.2.7 |
| aws       | 4.38.0 |

### **Inputs**

| Name                        | Description                                                                             | Type         | Default    |
|-----------------------------|-----------------------------------------------------------------------------------------|--------------|------------|
| additional_tags             | Mention additional tags if any. Number of additional tags can not exceed a limit of 37. | map          | { }        |
| description                 | Provide value for the tag: Description                                                  | string       |            |
| function                    | Function/scope of the s3. Same value will be used for tag : Name                        | string       |            |
| increment_code              | Increment code to append to the instance name.                                          | string       |            |
| name                        | Name of the s3.                                                                         | string       |            |
| owner                       | Provide value for the tag: Owner                                                        | string       |            |
| project                     | Provide value for the tag: Project                                                      | string       |            |
| region                      | AWS region to use.                                                                      | string       |            |
| s3_bucket_name              | Name of the s3 bucket.                                                                  | string       |            |
| complete_lock               | Whether to enable the vault lock.                                                 | bool        | false      |
| policy                      | The vault lock policy as a JSON string. |string      | ""         |
| vault_name | The name of the vault. | string | "" |
| access_policy | The vault access policy as a JSON string. | string | "" |
| notification | The vault notification configuration as a JSON string. | string | "" |

### **Outputs**

| Name | Description |
|------|-------------|
| vault_arn | The ARN of the vault. |
| vault_name | The name of the vault. |

### **Authors**
- Arjun Manoj Kumar



