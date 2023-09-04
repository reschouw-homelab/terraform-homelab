resource "aws_sns_topic" "slack-alerts" {
  name   = "slack-alerts"
  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "SNS:Publish",
      "Resource": "arn:aws:sns:us-west-2:841800532843:slack-alerts"
    },
    {
      "Sid": "AWSEvents_spot-interrupts_Id3320758245323",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sns:Publish",
      "Resource": "arn:aws:sns:us-west-2:841800532843:slack-alerts"
    }
  ]
})
}
