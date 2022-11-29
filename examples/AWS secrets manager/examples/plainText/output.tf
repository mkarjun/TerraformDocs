output "secret_ids" {
  description = "Secret ids"
  value       = module.secrets-manager-PlainText.secret_ids
}

output "secret_arns" {
  description = "Secrets arns"
  value       = module.secrets-manager-PlainText.secret_arns
}
output "rotation_enabled" {
  description = "Rotation enabled"
  value       = module.secrets-manager-PlainText.rotation_enabled
}