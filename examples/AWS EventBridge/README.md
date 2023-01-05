# **Terraform AWS Module for EventBridge Rules**
This module can be used to create EventBridge Rules for SNS,Lambda and ECS Targets.

### **Table of Contents**

- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
```
module "eventbridge" {
    source = "../eventbridge-rules-v1.0.1"
    # add your inputs here...
}
```

## Examples

- [EventBridge with Basic Configuration](examples\eventbridge-rule-with-basic-configuration\README.md)
- [EventBridge with Multiple target Configuration](examples\eventbridge-rule-with-multiple-targets\README.md)

### **Requirements**

| Name | Version |
| ------ | ------| 
| terraform | 0.13.4 | 
| aws       | 4.22.0 |

### **Inputs**

| Name | Description |Type| Default|
| ----- | ----- | ------ |----- | 
| description                    | Provide value for the tag: Description                                                   | string       |         |
| function                       | Function/scope of the s3. Same value will be used for tag : Name                         | string       |         |
| increment_code                 | Increment code to append to the instance name.                                           | string       |         |
| common_tags                    | General resource tags                                                                    | map          |         |
| naming_prefix_upper            | Part of name (WANV-0-LAB...)                                                             | string       |         |
| create_bus                     | Whether Event Bus to be created                                                          | boolean      |         |
| event_target_create            | Whether Event target to be created                                                       | boolean      |         |
| eventbridge_rules              | EventBridge rule                                                                         | map          | { }     |
| description                    | Description of EventBridge rule                                                          | string       |         |
| is_enabled                     | Enablement of EventBridge rule                                                           | string       |         |
| event_pattern                  | event_pattern of EventBridge rule                                                        | string       |         |
| schedule_expression            | schedule_expression of EventBridge rule                                                  | string       |         |
| role_arn                       | role_arn of EventBridge rule                                                             | string       |         |
| eventbridge_targets            | EventBridge targets                                                                      | map          | { }     |
| target_id                      | target_id of EventBridge targets                                                         | string       |         |
| target_arn                     | target_arn of EventBridge targets                                                        | string       |         |
| input                          | input of EventBridge targets                                                             | string       |         |
| ecs_target                     | ECS EventBridge target                                                                   | map          | { }     |
| group                          |group name of ECS EventBridge target                                                      | string       |         |
| launch_type                    |launch_type of ECS EventBridge target                                                     | string       |         |
| platform_version               |platform_version of ECS EventBridge target                                                | string       |         |
| task_count                     |task_count of ECS EventBridge target                                                      | string       |         |
| task_definition_arn            |task_definition_arn of ECS EventBridge target                                             | string       |         |
| network_configuration          | Network configuration for ECS Eventbridge target                                         | map          | { }     |
| subnets                        | subnets of Network configuration for ECS Eventbridge target                              | string       |         |
| security_groups                | security_groups of Network configuration for ECS Eventbridge target                      | string       |         |
| assign_public_ip               | assign_public_ip of Network configuration for ECS Eventbridge target                     | string       |         |

## Outputs

| Name        | Description                              |
| ----------- | ---------------------------------------- |
| eventbridge_rule_arns  | Amazon Resource Name (ARN) of the Eventbridge rule |
| eventbridge_rule_ids   | ID of the Eventbridge rule                       |

## Authors

- Arjun Manoj Kumar
