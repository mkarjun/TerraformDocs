output "lambda_arn" {
  value = aws_lambda_function.main.arn
}

output "lambda_name" {
  value = aws_lambda_function.main.function_name
}

output "invoke_arn" {
  value = aws_lambda_function.main.invoke_arn
}
