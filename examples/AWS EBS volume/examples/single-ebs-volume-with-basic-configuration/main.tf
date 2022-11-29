module "ebs" {
  source              = "../../"
  final_snapshot      = true
  outpost_arn         = null
  throughput          = null
  ebs_volumes = {
    ebs = {
      availability_zone = "us-east-1b"
      size              = 1
      function          = "SpringBootAdmin"
      kms_key_id        = "arn:aws:kms:us-east-1:<AccountID>:key/***"
      description       = "EBS volume for SpringBootAdmin Instance"
    }
  }
}