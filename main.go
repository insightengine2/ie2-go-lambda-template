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

	res := "Placeholder response. It works!"
	region := os.Getenv("AWS_REGION")

	// Load session from shared config
	_, err := session.NewSession(&aws.Config{
		Region: aws.String(region)},
	)
	if err != nil {
		return fmt.Sprintf("Error: %s", err)
	}

	// TODO: Insert your command below...
	//	The following block comment is here for illustrative purposes only

	/*****************************

	// Create new EC2 client
	svc := ec2.New(sess)

	input := &ec2.StartInstancesInput{
		InstanceIds: []*string{
			aws.String(ev.InstanceId),
		},
		DryRun: aws.Bool(true),
	}

	// try your command first
	result, err := svc.StartInstances(input)
	awsErr, ok := err.(awserr.Error)

	if ok && awsErr.Code() == "DryRunOperation" {
		// Let's now set dry run to be false. This will allow us to run the command for realz
		input.DryRun = aws.Bool(false)
		result, err = svc.StartInstances(input)
		if err != nil {
			res = fmt.Sprintf("Error: %s", err)
		} else {
			res = fmt.Sprintf("Success: %s", result.GoString())
		}

	} else { // This could be due to a lack of permissions
		res = fmt.Sprintf("Error: %s", err)
	}

	*****************************/

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
