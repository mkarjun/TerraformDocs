# Terraform AWS Module for AWS Backup
This module can be used to create AWS Backup.

## Table of Contents
- [Usage](#usage)
- [Examples](#examples)
- [Requirements](#requirements)
- [Notes](#notes)
- [Inputs](#inputs)
    * [AWS Rule](#rule)
    * [AWS lifecycle](#lifecycle)
    * [AWS copy action](#copy-action)
    * [AWS advanced backup setting](#advanced-backup-setting)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
```
module "backup" {
  source = "git::https://gitlab.wuintranet.net/terraform-module-registry/aws/aws-backup?ref=v1.0.1"
  # add your inputs here...
}
```

## Examples
- [AWS Backup with Basic Configuration](Examples/basic_configuration/)
- [AWS Backup with Custom Configuration](Examples/custom_configuration)

### **Requirements**

| Name      | Version |
| --------- | ------- |
| terraform | 1.2.7   |
| aws       | 4.38.0  |

## Notes

- Add vault lock as true to enable vault lock in custom configuration example.

### **Inputs**

| Name | Description | Type | Default |
|------|-------------|------|---------|
force_destroy | (Optional)  A boolean that indicates all objects should be deleted from the vault so that the vault can be destroyed without error. These objects are not recoverable. | bool  | false
kms_key_arn | (Optional)  The server-side encryption key that is used to protect your backups | string
tags | (Optional)  A mapping of tags that are assigned to the resources. | map(string)
target_plan_name | (Required)  The display name of a backup plan. | string | BKPPLN
rule | (Required)  The rule object that is used to specify a rule for a backup plan. | list(object)
tags | (Optional)  A mapping of tags that are assigned to the resources. | string
advanced_backup_settings | (Optional)  The backup options for a selected resource type. | object
name | (Required)  The display name of a backup plan. | string
iam_role_arn | (Required)  The Amazon Resource Name (ARN) of the IAM role that AWS Backup uses to authenticate when restoring the target resource. | string
plan_id | (Required)  The backup plan ID to be associated with the selection of resources. | string
condition | (Optional)  A list of conditions that you define to assign resources to your backup plans using tags. | string

### Rule
| Name | Description | Type | Default |
|------|-------------|------|---------|
rule_name | (Required)  The display name of a backup plan rule. | string
target_vault_name | (Required)  The name of a logical container where backups are stored. | string | VAULT
completion_window | (Optional)  The amount of time AWS Backup attempts a backup before canceling the job and returning an error. | number | 180
copy_action | (Optional)  An array of key-value pair strings that are assigned to resources that are associated with this rule when restored from backup. | list(object)
lifecycle | (Optional)  An array of key-value pair strings that are assigned to resources that are associated with this rule when restored from backup. | object
recovery_point_tags | (Optional)  An array of key-value pair strings that are assigned to resources that are associated with this rule when restored from backup. | map(string)
schedule | (Optional)  A CRON expression specifying when AWS Backup initiates a backup job. | string | cron(0 12 * * ? *)
start_window | (Optional)  The amount of time in minutes before beginning a backup. | number | 60
resources |  (Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan. | list(string)
not_resources | (Optional) An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan. | list(string)

### Lifecycle
| Name | Description | Type | Default |
|------|-------------|------|---------|
cold_storage_after | (Required)  Specifies the number of days after creation that a recovery point is moved to cold storage.| number | 90
delete_after | (Required)  Specifies the number of days after creation that a recovery point is deleted.| number | 360

### Copy Action
| Name | Description | Type | Default |
|------|-------------|------|---------|
destination_vault_arn | (Required)  An Amazon Resource Name (ARN) that uniquely identifies the destination backup vault for the copied backup.| string |
life_cycle | (Optional)  The lifecycle defines when a protected resource is copied over to a backup vault and when it expires. Fields documented above.| object

### Advanced Backup Setting
| Name | Description | Type | Default |
|------|-------------|------|---------|
backup_options | (Required)  Specifies the backup option for a selected resource. This option is only available for Windows VSS backup jobs. Set to { WindowsVSS = "enabled" } to enable Windows VSS backup option and create a VSS Windows backup.| list(object)
resource_type | (Required)  The type of AWS resource to be backed up; for example, an Amazon Elastic Block Store (Amazon EBS) volume or an Amazon Relational Database Service (Amazon RDS) database. | string


## Outputs

| Name                   | Description                                     |
| ---------------------- | ----------------------------------------------- |
| backup_plan_name       |The name of Backup plan created                  |
| backup_vault_name      |The name of Backup vault created                 |

## Authors
- Arjun Manoj Kumar
