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

variable "iac-bucket" {
    default = "ie2-iac"
    type    = string
}