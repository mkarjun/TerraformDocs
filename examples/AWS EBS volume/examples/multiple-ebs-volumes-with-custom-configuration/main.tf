module "ebs" {
  source              = "../../"
  final_snapshot      = true
  outpost_arn         = null
  throughput          = null
  additional_tags = {
    CreatedBy = "Terraform"
  }
  ebs_volumes = {
    springbootadmin = {
      availability_zone = "us-east-1a"
      size              = 50
      function          = "SpringBootAdmin"
      kms_key_id        = "arn:aws:kms:us-east-1:<AccountID>:key/***"
      description       = "EBS volume for SpringBootAdmin Instance"
    }
    bastionhost = {
      availability_zone = "us-east-1b"
      size              = 1
      type              = "gp3"
      function          = "BastionHost"
      kms_key_id        = "arn:aws:kms:us-east-1:<AccountID>:key/***"
      description       = "EBS volume for Bastion Host"
    }
  }
}
