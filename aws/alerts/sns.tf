resource "aws_sns_topic" "slack-alerts" {
  name = "slack-alerts"
  tags = {
    terraform = true
  }
}
