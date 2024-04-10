#!/bin/bash

# -tags lambda.norpc
#   reduces binary size by excluding the remote procedure call component
# -ldflags="-s -w"
#   reduces binary size by removing debug libraries
env GOOS="linux" CGO_ENABLED="0" GOARCH="arm64" GOTOOLCHAIN="local" \
    go build \
    -tags lambda.norpc \
    -ldflags="-s -w" \
    -o ./dist/bootstrap main.go

# copy the config
cp ie2-config.yml ./dist/ie2-config.yml

cd ./dist
chmod +x bootstrap
zip bootstrap.zip bootstrap