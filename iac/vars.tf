## Lambda Component
variable "lambda-name" {
    default = "my-lambda-name"
    type    = string
}

## Tags
variable "tag-project" {
    default = "ie2"
    type    = string
}

variable "tag-environment" {
    default = "prod"
    type    = string
}

## Region
variable "region" {
    default = "us-east-1"
    type    = string
}

## Project Variables
variable "filename" {
    default = "main.zip"
    type    = string
}

variable "iac-root-bucket" {
    default = "ie2-iac"
    type    = string
}

variable "api-resource" {
    default     = "poc"
    type        = string
    description = "The resource name for which your endpoint is responsible."
}

variable "runtime" {
    default = "provided.al2023"
    type    = string
}

variable "handler" {
    default = "main"
    type    = string
}