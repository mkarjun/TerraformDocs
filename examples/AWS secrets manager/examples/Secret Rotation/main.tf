module "secrets-manager-secret-rotation" {
  source         = "../../"
  description    = "Secret Rotation"
  naming_prefix  = module.tagsmap.naming_prefix_upper
  common_tags    = module.tagsmap.common_tags
  increment_code = "005"
  rotate_secrets = {
    secret-rotate-100 = {
      description             = "This is a secret to be rotated by a lambda"
      secret_string           = file("${path.module}/RSpass.pem")
      rotation_lambda_arn     = "arn:aws:lambda:us-east-1:<AccountID>:function:-007"
      recovery_window_in_days = 7
    }
    secret-rotate-101 = {
      description             = "This is another secret to be rotated by a lambda"
      secret_string           = file("${path.module}/RSpass.pem")
      rotation_lambda_arn     = "arn:aws:lambda:us-east-1:<AccountID>:function:-007"
      recovery_window_in_days = 7
    },
  }
}

module "rotate_secret_lambda" {
  source         = "../../../lambda-function-v1.0.1"
  increment_code   = "007"
  role_arn         = "arn:aws:iam::<AccountID>:role/service-role/***"
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

