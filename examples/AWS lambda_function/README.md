# Terraform AWS Module for Lambda function

This module can be used to launch an Lambda function.

## Table of Contents

-   [Usage](#usage)
-   [Examples](#examples)
-   [Requirements](#requirements)
-   [Inputs](#inputs)
-   [Outputs](#outputs)
-   [Authors](#authors)

## Usage

```
module "lambda_function" {
  source = "./"
  # add your inputs here...
}
```

## Examples

-   [lambda with Basic Configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20lambda_function)
-   [lambda with Advanced Configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20lambda_function)

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | 1.2.0   |
| aws       | 4.19.0  |

## Inputs

| Name                           | Description                                                                                                                                                                | Type         | Default |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | ------- |
| additional_tags                | Mention additional tags if any. Number of additional tags can not exceed a limit of 37.                                                                                    | map          | { }     |
| description                    | Provide value for the tag: Description                                                                                                                                     | string       |         |
| function                       | Function/scope of the s3. Same value will be used for tag : Name                                                                                                           | string       |         |
| increment_code                 | Increment code to append to the instance name.                                                                                                                             | string       |         |
| common_tags                    | General resource tags                                                                                                                                                      | map          |         |
| naming_prefix                  | Part of name (WANV-0-LAB...)                                                                                                                                               | string       |         |
| file_name                      | Lambda function code file name. should be in zip                                                                                                                           | string       |         |
| role_arn                       | Amazon Resource Name (ARN) of the function's execution role.                                                                                                               | string       |         |
| handle_file_name               | Function entrypoint in your code.                                                                                                                                          | string       | null    |
| runtime                        | Identifier of the function's runtime.                                                                                                                                      | string       |         |
| storage                        | The amount of Ephemeral storage(/tmp) to allocate for the Lambda Function in MB.                                                                                           | number       | 512     |
| architectures                  | Instruction set architecture for your Lambda function.                                                                                                                     | list(string) | x86_64  |
| code_signing_config_arn        | To enable code signing for this function, specify the ARN of a code-signing configuration.                                                                                 | string       |         |
| environment                    | Environment variables that are accessible from the function code during execution.                                                                                         | map          | {}      |
| kms_key_arn                    | Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables."                                                     | string       |         |
| timeout                        | Amount of time your Lambda Function has to run in seconds.                                                                                                                 | number       | 3       |
| memory_size                    | Amount of memory in MB your Lambda Function can use at runtime.                                                                                                            | number       | 128     |
| publish                        | Whether to publish creation/change as new Lambda Function Version.                                                                                                         | bool         | false   |
| reserved_concurrent_executions | Amount of reserved concurrent executions for this lambda function.                                                                                                         | number       | -1      |
| layers                         | list of lambda layer Amazon Resource Name (ARN)                                                                                                                            | list(string) | []      |
| vpc_config                     | VPC information. Read more on [Terraform vpc_config documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function#vpc_config) | object       | -       |
| source_code_hash               | Identify source code changes                                                                                                                                               | bool         | -       |

## Outputs

| Name        | Description                              |
| ----------- | ---------------------------------------- |
| lambda_arn  | Amazon Resource Name (ARN) of the lambda |
| lambda_name | Name of the new function                 |

## Authors

- Arjun Manoj Kumar
