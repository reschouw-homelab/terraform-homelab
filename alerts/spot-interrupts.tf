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
}

resource "aws_cloudwatch_event_target" "slack-alert" {
  target_id = "slack-alert"
  rule = aws_cloudwatch_event_rule.spot-interrupts.name
  arn = aws_sns_topic.slack-alerts.arn
}

resource "aws_sns_topic_policy" "spot-interrupts" {
  arn = aws_sns_topic.slack-alerts.arn
  policy = data.aws_iam_policy_document.events-to-slack.json
}

data "aws_iam_policy_document" "events-to-slack" {
  statement {
    effect = "Allow"
    actions = ["SNS:Publish"]
    
    principals {
      type = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    resources = [aws_sns_topic.slack-alerts.arn]
  }
}
