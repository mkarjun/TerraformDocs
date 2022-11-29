output "name" {
  value = aws_elastic_beanstalk_environment.tfenvtest.name
}

output "id" {
  value = aws_elastic_beanstalk_environment.tfenvtest.id
}

output "application" {
  value = aws_elastic_beanstalk_application.tftest.name
}
