module "lambda_function" {
  source           = "../../"
  increment_code   = "001"
  function         = "demo-function"
  file_name        = "source_code.zip"
  description      = "Demo lambda function "
  storage          = 512
  runtime          = "nodejs16.x"
  role_arn         = "arn:aws:iam::<AccountID>:role/service-role"
  handle_file_name = "main.js"
}
