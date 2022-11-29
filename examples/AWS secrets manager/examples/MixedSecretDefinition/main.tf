module "MixedSecretDefinition" {
  source         = "../../"
  description    = "Mixed Secret Definition"
  increment_code = "100"
  secrets = {
    secret-plain-205 = {
      description             = "My plain text secret"
      recovery_window_in_days = 7
      secret_string           = file("${path.module}/PTpass.pem")
    },
    secret-key-value-205 = {
      description = "This is a key/value secret"
      secret_key_value = {
        username = "user"
        password = file("${path.module}/KVpass.pem")
      }
      tags = {
        app = "web"
      }
      recovery_window_in_days = 7
    },
    secret-binary-205 = {
      description             = "This is a binary secret"
      name                    = "secret-binary-2"
      description             = "Another binary secret"
      secret_binary           = file("${path.module}/Bpass.pem")
      recovery_window_in_days = 7
      tags = {
        app = "web"
      }
    },
  }
  rotate_secrets = {
    secret-rotate-106 = {
      description             = "This is another secret to be rotated by a lambda"
      secret_string           = file("${path.module}/RSpass.pem")
      rotation_lambda_arn     = "arn:aws:lambda:us-east-1:<AccountID>:function:***-007"
      recovery_window_in_days = 7
    }
  }
}

module "rotate_secret_lambda" {
  source         = "../../../../AWS lambda_function"
  increment_code   = "007"
  role_arn         = "arn:aws:iam::<AccountID>:role/service-role/***-role-lr4pdx3i"
  description      = "Demo lambda function "
  file_name        = "secrets_manager_rotation.zip"
  function         = "secrets-manager-rotation"
  runtime          = "python3.8"
  handle_file_name = "lambda_function.py"
# Enable this if you want to use a Rotation
  enable_rotation  = true
  statement_id     = "AllowExecutionManager"
  action           = "lambda:InvokeFunction"
  principal        = "secretsmanager.amazonaws.com"
}