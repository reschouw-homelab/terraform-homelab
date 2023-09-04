module "firefly-auth" {
  source                = "github.com/gofireflyio/terraform-firefly-aws-onboarding?ref=v1.12.0/modules/firefly_auth"
  firefly_access_key    = "INFLWQJWFAVUBZKZQIMZ"
  firefly_secret_key    = "B0wtxyWFbFvp3RG9Gq8FmeAUQzPcLQfgCuxlWoJsWkxpc1nA94J9VDeEl1muCciB"
}

module "firefly" {
  source                = "github.com/gofireflyio/terraform-firefly-aws-onboarding?ref=v1.12.0"
  firefly_token         = module.firefly-auth.firefly_token
  name                  = "AWS"
  is_prod               = false
  role_external_id      = "MC42MjE0Njc3NzY4NzQ1MTI"
  is_event_driven       = true
  event_driven_regions  = ["us-east-1","us-east-2","us-west-1","us-west-2","af-south-1","ap-east-1","ap-south-1","ap-southeast-1","ap-southeast-2","ap-northeast-1","ap-northeast-2","ap-northeast-3","ca-central-1","cn-north-1","cn-northwest-1","eu-central-1","eu-west-1","eu-west-2","eu-west-3","eu-south-1","eu-north-1","me-south-1","sa-east-1"]
}
