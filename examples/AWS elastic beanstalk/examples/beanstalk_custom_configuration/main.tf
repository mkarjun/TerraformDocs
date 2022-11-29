module "beanstalk_basic_configuration" {
  source                 = "../../"
  function               = "tf"
  function1              = "tf-test"
  increment_code         = "001"
  app_description        = "tf-test-desc"
  tier                   = "WebServer"
  solution_stack_name    = "64bit Amazon Linux 2 v3.4.1 running Python 3.8"
  wait_for_ready_timeout = "10m"
  version_label          = "v1.0.0"
  appversion_lifecycle = [{
    service_role = "arn:aws:iam::<AccountID>:role/***"
    max_count    = 5
  }]
  setting = [{
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }]
}