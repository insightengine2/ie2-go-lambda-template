## Lambda Component
variable "lambda-name" {
    default = "lambda-poc"
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
    default = "bootstrap.zip"
    type    = string
}

variable "iac-root-bucket" {
    default = "ie2-iac"
    type    = string
}

variable "api-resource" {
    default = "poc"
    type    = string
}

variable "aws-runtime" {
    default = "provided.al2"
    type    = string
}

variable "architecture" {
    default = "arm64"
    type    = string
}

variable "handler" {
    default = "bootstrap"
    type    = string
}