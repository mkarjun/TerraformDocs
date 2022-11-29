output "volume_ids" {
  value       = { for item in keys(aws_ebs_volume.main) : item => aws_ebs_volume.main[item].id }
  description = "List of IDs of EBS volumes"
}