module "beanstalk_basic_configuration" {
  source              = "../../"
  function            = "tf-001"
  function1           = "tf-test-001"
  increment_code      = "001"
  app_description     = "tf-test-desc"
  solution_stack_name = "64bit Amazon Linux 2 v3.4.1 running Python 3.8"
  appversion_lifecycle = [{
    service_role = "arn:aws:iam::<AccountID>:role/ElasticBeanstalkCloudwatch"
    max_count    = 5
  }]
  setting = [{
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    name      = "StreamLogs"
    value     = "ElasticBeanstalkCloudwatch"
  }]
}