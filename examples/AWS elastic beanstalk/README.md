# **Terraform AWS Module for AWS Elastic Beanstalk**
This module can be used to create AWS Elastic Beanstalk.

## **Table of Contents**
- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Notes](#notes)
- [Inputs](#inputs)
    * [Option Settings](#option-settings)
    * [Application version lifecycle](#application-version-lifecycle)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
```
module "beanstalk_basic_configuration" {
  source = "./"
  # add your inputs here...
}
```

## Examples

- [beanstalk-basic-configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20elastic%20beanstalk)
- [beanstalk-with-custom-configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20elastic%20beanstalk)

### **Requirements**
| Name | Version |
| ------ | ------|
| terraform | 1.2.7 |
| aws       | 4.39.0 |

### **Notes**
- This module is tested with terraform version 1.2.7 and aws provider version 4.39.0.
- While using this module, please make sure that only one of either max_count or max_age_in_days is provided

### **Inputs**
| Name                        | Description                                                                             | Type         | Default    |
|-----------------------------|-----------------------------------------------------------------------------------------|--------------|------------|
| additional_tags             | Mention additional tags if any. Number of additional tags can not exceed a limit of 37. | map          | { }        |
| description                 | Provide value for the tag: Description                                                  | string       |            |
| function                    | Function/scope of the beanstalk environment. Same value will be used for tag : Name                        | string       |            |
| increment_code              | Increment code to append to the instance name.                                          | string       |            |
| name                        | The name of the application, must be unique within your account                                                                      | string       |            |
| owner                       | Provide value for the tag: Owner                                                        | string       |            |
| project                     | Provide value for the tag: Project                                                      | string       |            |
| region                      | AWS region to use.                                                                      | string       |            |
| application_name | The name of the application. | string | "" |
| environment_name | The name of the environment. | string | "" |
| solution_stack_name | The name of the solution stack on which to base the environment. | string | "" |
| tier | The tier of the environment. | string | "" |
| version_label | The name of the application version to deploy. | string | "" |
| setting | A list of configuration option settings to apply to the Elastic Beanstalk environment. | list | [] |
| template | The name of the configuration template. | string | "" |
| template_specification | The configuration template specification. | list | [] |
| setting | A list of configuration option settings to apply to the Elastic Beanstalk environment. | list | [] |
| template_name | The name of the configuration template. | string | "" |
| wait_for_ready_timeout | The maximum amount of time to wait for an environment to be ready. | string | "10m" |
| poll_interval | The interval to check for an environment to be ready. | string | "10s" |

###  Option Settings
| Name                        | Description                                                                             | Type         | Default    |
|-----------------------------|-----------------------------------------------------------------------------------------|--------------|------------|
| namespace | The namespace of the option setting. | string | "" |
| option_name | The name of the option. | string | "" |
| resource_name | The name of the associated AWS resource. | string | "" |
| value | The value for this option. | string | "" |

### Application version lifecycle
| Name                        | Description                                                                             | Type         | Default    |
|-----------------------------|-----------------------------------------------------------------------------------------|--------------|------------|
| delete_source_from_s3 | Whether to delete the source bundle from S3 upon successful application version creation. | bool | false |
| max_count | The maximum number of application versions to retain. | number | 0 |
| max_age_in_days | The maximum age in days of application versions to retain. | number | 0 |


### **Outputs**
| Name                        | Description                                                                             |
|-----------------------------|-----------------------------------------------------------------------------------------|
| application | The name of the application. |
| name | The name of the environment. |
| id | The ID of the environment. |


### Authors
- Arjun Manoj Kumar




