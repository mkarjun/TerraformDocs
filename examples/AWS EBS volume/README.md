# **Terraform AWS Module for EBS Volumes**

This module can be used to provision one or more EBS volumes with KMS Key Encryption.

### **Table of Contents**
- [Usage](#usage)
- [Module Features](#module-features)
- [Examples](#examples)
- [Requirements](#requirements)
- [Inputs](#inputs)
  * [EBS Volumes](#ebs-volumes)
- [Outputs](#outputs)
- [Authors](#authors)

### **Usage**
```
module "ebs" {
  source = "./"
  # add your inputs here...
}
```

## Module Features
- Allows provisioning of one or more EBS volumes.
- KMS Key Encryption enforced.
- Supports `standard`, `gp2`, `gp3`, `io1`, `io2`, `sc1` and `st1` volume types.
- Allows provisioning of volumes from the snapshot ID specified.

## Examples
- [Single EBS Volume with Basic Configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20backup)
- [Multiple EBS Volumes with Custom Configuration](https://github.com/mkarjun/TerraformDocs/tree/main/examples/AWS%20backup)

## Requirements
| Name	     | Version   |
| ---------- | --------- |
| terraform  |	1.2.7    |
| aws        |  4.38.0   |

### **Inputs**
| Name | Description | Type | Default |
|------|-------------|------|---------|
common_tags | (Required) Set of common tags. | string
ebs_volumes | (Required) One or more configuration blocks for the EBS volumes. See [EBS Volumes](#ebs-volumes) below for details on attributes. | map | { }
naming_prefix_upper | (Required) Resource naming prefix in upper case. Example: WANV-SHS-0 | string
availability_zone | (Required) The AZ where the EBS volume will exist. | string
description | (Required) Description for the EBS Volume. | String
function | (Required) Function/Scope of the EBS Volume. | String
iops | (Optional) The amount of IOPS to provision for the disk. Only valid for type of `io1`, `io2` or `gp3`. | string
multi_attach_enabled | (Optional) Specifies whether to enable Amazon EBS Multi-Attach. Only supported on `io1` and `io2` volumes. | bool | false
size | (Required) The size of the drive in GiBs. | string
snapshot_id | (Optional) A snapshot to base the EBS volume off of. | string
type | (Optional) The type of EBS volume. Can be `standard`, `gp2`, `gp3`, `io1`, `io2`, `sc1` or `st1`. | String | gp2
kms_key_id | (Required) The ARN for the KMS encryption key. | String
final_snapshot - | (Optional) If true, snapshot will be created before volume deletion. Any tags on the volume will be migrated to the snapshot. | bool | false
  
## Outputs
| Name | Description |
|------|-------------|
volume_ids | List of IDs of EBS volumes

## Authors
- Arjun Manoj Kumar
