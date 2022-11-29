output "backup_vault_name" {
  value = aws_backup_vault.this.name
}

output "backup_plan_name" {
  value = aws_backup_plan.this.name
}
