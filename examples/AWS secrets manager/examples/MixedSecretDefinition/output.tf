output "secret_ids" {
  description = "Secret ids"
  value       = module.MixedSecretDefinition.secret_ids
}

output "secret_arns" {
  description = "Secrets arns"
  value       = module.MixedSecretDefinition.secret_arns
}

output "rotation_enabled" {
  description = "Rotation enabled"
  value       = module.MixedSecretDefinition.rotation_enabled
}