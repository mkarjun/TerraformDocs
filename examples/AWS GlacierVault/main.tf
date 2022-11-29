locals {
  glacier_vault_name = "GLR-${var.function}-${var.increment_code}"
}

resource "aws_glacier_vault" "main" {
  name = local.glacier_vault_name
  notification {
    sns_topic = var.sns_topic_arn
    events    = ["ArchiveRetrievalCompleted", "InventoryRetrievalCompleted"]
  }
  access_policy = var.access_policy_json_file_path == null ? null : file(var.access_policy_json_file_path)
}
resource "aws_glacier_vault_lock" "example" {
  count         = var.enable_vault_lock ? 1 : 0
  complete_lock = var.complete_lock
  policy        = var.access_policy_json_file_path == null ? null : file(var.access_policy_json_file_path)
  vault_name    = aws_glacier_vault.main.name
}