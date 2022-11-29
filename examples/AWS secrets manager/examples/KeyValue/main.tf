module "secrets-manager-KeyValue" {
  source         = "../../"
  description   = "KeyValue Secrets"
  secrets = {
    secret-kv-001 = {
      description = "This is a key/value secret"
      secret_key_value = {
        key1 = "value1"
        key2 = file("${path.module}/password.pem")
      }
      recovery_window_in_days = 7
    },
    secret-kv-001 = {
      description = "Another key/value secret"
      secret_key_value = {
        username = "user"
        password = file("${path.module}/password.pem")
      }
      tags = {
        app = "web"
      }
      recovery_window_in_days = 7
    },
  }
}
