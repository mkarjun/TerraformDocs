output "secret_ids" {
  description = "Secret ids"
  value       = module.secrets-manager-KeyValue.secret_ids
}

output "secret_arns" {
  description = "Secrets arns"
  value       = module.secrets-manager-KeyValue.secret_arns
}

output "rotation_enabled" {
  description = "Rotation enabled"
  value       = module.secrets-manager-KeyValue.rotation_enabled
}