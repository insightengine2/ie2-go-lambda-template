resource "aws_cloudwatch_event_rule" "my-event-rule-name" {
  name              = "my-event-rule-name"
  description       = "my-description"
  event_bus_name    = "default"

  event_pattern     = jsonencode({

  })
}

resource "aws_cloudwatch_event_target" "my-target-name" {
  rule  = aws_cloudwatch_event_rule.my-event-rule-name.name
  arn   = aws_lambda_function.my-lambda-name.arn

  retry_policy {
    maximum_event_age_in_seconds  = 3600
    maximum_retry_attempts        = 5
  }

  input_transformer {
    input_paths     = { }
    
    input_template = <<EOF
EOF
  } 
}

resource "aws_lambda_function" "my-lambda-name" {
  filename          = "../dist/${var.filename}"
  function_name     = "${var.lambda-name}"
  role              = data.terraform_remote_state.dsf.outputs.role_lambda_arn
  source_code_hash  = filebase64sha256("../dist/${var.filename}")
  runtime           = "go1.x"
  handler           = "main"
  timeout           = 180
}