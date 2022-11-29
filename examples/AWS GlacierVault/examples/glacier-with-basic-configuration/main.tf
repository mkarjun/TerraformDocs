
module "glacier_vault" {
  source = "../.."
  function = "AutomationTest"
  increment_code = "001"
  description = "Sample glacier vault created by automation pillar"
  sns_topic_arn = "arn:aws:sns:us-east-1:<AccountID>:Default_CloudWatch"
  access_policy_json_file_path = "vault-policy.json"
}