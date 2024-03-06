# IE2 Lambda Template

A template project for creating GO lambdas

## How to Use This Template

- Create a new repo based off this template
- Edit the src/main.go file
    - Add your custom logic to the function `EventHandler`
- Edit the iac/vars.tf file
    - Update the string value for the variable <lambda-name>
- Edit the iac/lambda.tf
    - Change the resource names and references as necessary

You shouldn't need to change the build.ps1 script

This project assumes your lambda's primary entry point is the main function and assuming you don't change that everything should just work

## Usage PreRequisite(s)

- go v1.17.x
- build-lambda-zip tool
    - `go install github.com/aws/aws-lambda-go/cmd/build-lambda-zip@latest`
- Terraform

## Compile & Deploy Steps

- Open Powershell prompt in the src folder
    - `./build.ps1`
    
- In powershell, navigate to the iac folder
    - `terraform apply`
