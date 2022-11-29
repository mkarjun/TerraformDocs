resource "aws_ebs_volume" "main" {
  for_each             = var.ebs_volumes
  availability_zone    = each.value.availability_zone
  size                 = each.value.size
  final_snapshot       = var.final_snapshot
  outpost_arn          = var.outpost_arn
  throughput           = var.throughput
  encrypted            = true
  kms_key_id           = each.value.kms_key_id
  iops                 = lookup(each.value, "iops", null)
  multi_attach_enabled = lookup(each.value, "multi_attach_enabled", null)
  snapshot_id          = lookup(each.value, "snapshot_id", null)
  type                 = lookup(each.value, "type", null)
}
