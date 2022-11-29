output "secret_ids" {
  description = "Secret ids"
  value       = module.secrets-manager-secret-rotation.rotate_secret_ids
}

output "secret_arns" {
  description = "Secrets arns"
  value       = module.secrets-manager-secret-rotation.rotate_secret_arns
}

output "rotation_enabled" {
  description = "Rotation enabled"
  value       = module.secrets-manager-secret-rotation.rotation_enabled
}