# **Terraform AWS Secrets Manager**

Terraform module to create [Amazon Secrets Manager](https://aws.amazon.com/secrets-manager/) resources.

AWS Secrets Manager helps you protect secrets needed to access your applications, services, and IT resources. The service enables you to easily rotate, manage, and retrieve database credentials, API keys, and other secrets throughout their lifecycle.

## **Table of Contents**

-   [Usage](#usage)
-   [Examples](#examples)
-   [Requirements](#requirements)
-   [Inputs](#inputs)
-   [Outputs](#outputs)
-   [Authors](#authors)

## Examples

-   [secrets-manager-BinarySecrets](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20secrets%20manager)
-   [secrets-manager-key-value](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20secrets%20manager)
-   [secrets-manager-MixedSecretDefinition](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20secrets%20manager)
-   [secrets-manager-plaintext](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20secrets%20manager)
-   [secrets-manager-SecretRotation](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20secrets%20manager)



### **Requirements**
| Name | Version |
| ------ | ------|
| terraform |>= 0.12.0|
| aws       |>= 4.38.0 |

# Usage
```
module "secret-manager" {
  source = "./"
  # add your inputs here...
}
```

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| naming_prefix | (Required) Creates a unique name beginning with the specified prefix. | string | "" |
| common_tags | (Optional) A map of tags to add to all resources. | map | {} |
| increment_code | (Required) A unique code to increment the version of the secret. | string | "" |
| role_arn | (Required) The ARN of the role that you want to allow to invoke the function. | string | "" |
| description | (Optional) The description of the service (secret and lambda function in MixedSecretDefinition and Secret Rotation) | string | "" |
| file_name | (Required) The name of the file that contains the function code. | string | "" |
| function | (Required) The name of the Lambda function. | string | "" |
| runtime | (Required) The runtime environment for the Lambda function. | string | "" |
| handle_file_name | (Required) The name of the the function code. | string | "" |
| rotate_secrets | (Required) Configuration block to support secret creation (Rotate). | map | {} |
| secret_string | (Required) The secret string value that you want to store in the new version of the secret. | string | "" |
| rotation_lambda_arn | (Optional) ARN of the Lambda function that can rotate the secret. | string | "" |
| recovery_window_in_days | (Optional) Number of days that AWS Secrets Manager waits before it can delete the secret.  | number | 30 |
| enable_rotation | (Optional) Specifies whether automatic rotation is enabled for this secret. | bool | false |
| function_name | (Required) Name of the Lambda function whose resource policy you are updating  | string | "" |
| statement_id | (Required) A unique identifier for the new statement in the policy. | string | "" |
| action | (Required) The action that the principal can use on the function. | string | "" |
| principal | (Required) The AWS service or account that invokes the function. | string | "" |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_arns"></a> [secret\_arns](#output\_secret\_arns) | Secrets arns map |
| <a name="output_secret_ids"></a> [secret\_ids](#output\_secret\_ids) | Secret ids map |
| <a name="rotation_enabled"></a> [rotation\_enabled](#output\_secret\_rotaionenabled) | Whether automatic rotation is enabled |

## Authors

- Arjun Manoj Kumar
