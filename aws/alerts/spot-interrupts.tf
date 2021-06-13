resource "aws_cloudwatch_event_rule" "spot-interrupts" {
  name = "spot-interrupts"
  description = "Alert when spot instance is being interrupted"
  event_pattern = <<EOF
{
  "source" : [
    "aws.ec2"
  ],
  "detail-type" : [
    "EC2 Spot Instance Interruption Warning"
  ]
}
EOF
  tags = {
    terraform = true
  }
}

resource "aws_cloudwatch_event_target" "slack-alert" {
  target_id = "slack-alert"
  rule = aws_cloudwatch_event_rule.spot-interrupts.name
  arn = aws_sns_topic.slack-alerts.arn

}
