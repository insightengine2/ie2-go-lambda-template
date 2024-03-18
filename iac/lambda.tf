resource "aws_lambda_permission" "my-lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my-lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.region}:${data.terraform_remote_state.lambda-state.outputs.account-id}:${data.terraform_remote_state.lambda-state.outputs.rest-apigateway-id}/*/${aws_api_gateway_method.poc-get.http_method}${aws_api_gateway_resource.poc.path}"
} 

resource "aws_lambda_function" "my-lambda" {
  filename          = "../dist/${var.filename}"
  function_name     = "${var.lambda-name}"
  role              = data.terraform_remote_state.dsf.outputs.role_lambda_arn
  source_code_hash  = filebase64sha256("../dist/${var.filename}")
  runtime           = var.runtime
  handler           = var.handler
  timeout           = 180
}