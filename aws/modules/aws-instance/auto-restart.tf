resource "aws_cloudwatch_metric_alarm" "auto-recover" {
  alarm_name = "${var.hostname} has failed status check"
  namespace = "AWS/EC2"
  evaluation_periods = "2"
  period = "60"
  alarm_description = "Triggers an alert when ${var.hostname} has failing status checks"
  alarm_actions = [
    data.aws_sns_topic.slack-alerts.arn,
    "arn:aws:automate:us-west-2:ec2:recover",
  ]
  statistic = "Minimum"
  comparison_operator = "GreaterThanThreshold"
  threshold = "0"
  metric_name = "StatusCheckFailed_System"
  dimensions = {
    InstanceId = var.spot-instance ? aws_spot_instance_request.instance[0].spot_instance_id : aws_instance.instance[0].id
  }
  tags = {
    terraform = true
  }
}
