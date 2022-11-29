module "secrets-manager-BinarySecrets" {
  source         = "../../"
  description    = "Binary Secrets"
  increment_code = "005"
  secrets = {
    secret-binary-002 = {
      description             = "This is a binary secret"
      secret_binary           = file("${path.module}/amk.pem")
    },
    secret-binary-002 = {
      description             = "This is a binary secret"
      name                    = "secret-binary-2"
      description             = "Another binary secret"
      secret_binary           = file("${path.module}/amk.pem")
      recovery_window_in_days = 7
      tags = {
        app = "web"
      }
    }
  }
}
