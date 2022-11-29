module "secrets-manager-PlainText" {
  source         = "../"
  description    = "PlainText Secrets"
  increment_code = "001"
  secrets = {
    secret-PlainText-5 = {
      description             = "My secret 1"
      recovery_window_in_days = 7
      secret_string           = "This is an example"
    },
    secret-PlainText-6 = {
      description             = "My secret 2"
      recovery_window_in_days = 7
      secret_string           = "This is another example"
    }
  }
}