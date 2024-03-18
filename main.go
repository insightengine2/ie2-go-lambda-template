package main

import (
	"fmt"
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

func EventHandler(ev MyEvent) string {

	/*
	*	Replace all the code in this block with your custom implementation.
	 */

	res := "Placeholder response. It works!"
	region := os.Getenv("AWS_REGION")

	// Load session from shared config
	_, err := session.NewSession(&aws.Config{
		Region: aws.String(region)},
	)
	if err != nil {
		return fmt.Sprintf("Error: %s", err)
	}

	return res
}

func HandleEvent(ev MyEvent) (Response, error) {

	// Add any logic here and call implementation func
	res := EventHandler(ev)
	return Response{Message: res}, nil
}

// entry point to your lambda
func main() {
	lambda.Start(HandleEvent)
}
