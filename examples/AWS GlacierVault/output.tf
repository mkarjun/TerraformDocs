output "aws_glacier_vault_arn" {
  description = "ARN of glacier vault"
  value = aws_glacier_vault.main.arn
}
output "aws_glacier_vault_name" {
  description = "NAME of glacier vault"
  value = aws_glacier_vault.main.name
}