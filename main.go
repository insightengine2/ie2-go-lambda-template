package main

import (
	"context"
	"os"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
)

type MyEvent struct {
	// sample properties below
	InstanceId string `json:"InstanceId"`
	Status     string `json:"Status"`
}

type Response struct {
	Message string `json:"Message:"`
}

func HandleRequest(context context.Context, ev MyEvent) (Response, error) {

	res := Response{
		Message: "Success!",
	}
	region := os.Getenv("AWS_REGION")

	// Load session from shared config
	_, err := session.NewSession(&aws.Config{
		Region: aws.String(region)},
	)
	if err != nil {
		res.Message = "Error!"
	}

	return res, err
}

// entry point to your lambda
func main() {
	lambda.Start(HandleRequest)
}
