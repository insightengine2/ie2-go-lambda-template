# replace "my-resource" with your own name, and update references
resource "aws_api_gateway_resource" "my-resource" {
  rest_api_id = data.terraform_remote_state.lambda-state.outputs.rest-apigateway-id
  parent_id   = data.terraform_remote_state.lambda-state.outputs.rest-apigateway-root-resource-id
  path_part   = var.api-resource
}

# update with your method(s) and / or add new methods
# replace "my-method" with your own name and update references
resource "aws_api_gateway_method" "my-method" {
  rest_api_id   = data.terraform_remote_state.lambda-state.outputs.rest-apigateway-id
  resource_id   = aws_api_gateway_resource.my-resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# lambda only supports POST for integration_http_method, so don't change it
resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = data.terraform_remote_state.lambda-state.outputs.rest-apigateway-id
  resource_id             = aws_api_gateway_resource.my-resource.id
  http_method             = aws_api_gateway_method.my-method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.my-lambda.invoke_arn
}