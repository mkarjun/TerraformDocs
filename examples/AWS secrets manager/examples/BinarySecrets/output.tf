output "secret_ids" {
  description = "Secret ids"
  value       = module.secrets-manager-BinarySecrets.secret_ids
}

output "secret_arns" {
  description = "Secrets arns"
  value       = module.secrets-manager-BinarySecrets.secret_arns
}

output "rotation_enabled" {
  description = "Rotation enabled"
  value       = module.secrets-manager-BinarySecrets.rotation_enabled
}