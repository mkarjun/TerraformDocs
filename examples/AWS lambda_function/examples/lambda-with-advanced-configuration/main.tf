
module "lambda_function" {
  source           = "../.."
  increment_code   = "001"
  function         = "demo-function"
  file_name        = "source_code.zip"
  description      = "Demo lambda function "
  storage          = 512
  runtime          = "python3.8"
  role_arn         = "arn:aws:iam::<AccountID>:role/service-role"
  handle_file_name = "main.js"
  environment = {
    NODE_ENV   = "DEVELOPMENT"
    SECRET_KEY = "Demo-Secret"
  }
  vpc_config = {
    subnet_ids         = ["subnet-Id"]
    security_group_ids = ["sg-Id"]
  }
  timeout                        = 300
  memory_size                    = 512
  reserved_concurrent_executions = 5
  kms_key_arn                    = "arn:aws:kms:us-east-1:<AccountID>:key/***"
  layers                         = ["arn:aws:lambda:us-east-1:<AccountID>:layer:***"]
}
