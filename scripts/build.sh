#!/bin/bash

# -tags lambda.norpc exludes the remote procedure call component of the lambda library
# which reduces the binary size

# -ldflags="-s -w" removes debug libraries from the binary, making it smaller
env GOOS="linux" CGO_ENABLED="0" GOARCH="arm64" GOTOOLCHAIN="local" go build -tags lambda.norpc -ldflags="-s -w" -o ./dist/bootstrap main.go
cd ./dist
chmod +x bootstrap
zip bootstrap.zip bootstrap