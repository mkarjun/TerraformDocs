output "aws_glacier_vault_arn" {
  description = "ARN of glacier vault"
  value = module.glacier_vault.aws_glacier_vault_arn
}
output "aws_glacier_vault_name" {
  description = "NAME of glacier vault"
  value = module.glacier_vault.aws_glacier_vault_name
}