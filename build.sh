#!/bin/bash

GOOS="linux"
CGO_ENABLED="0"
GOARCH="arm64"

# -tags lambda.norpc exludes the remote procedure call component of the lambda library
# which reduces the binary size

go build -tags lambda.norpc -o ./dist/bootstrap main.go
cd ./dist
zip bootstrap.zip bootstrap