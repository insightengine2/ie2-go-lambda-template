$env:GOOS="linux"
$env:CGO_ENABLED="0"
$env:GOARCH="amd64"

# -tags lambda.norpc exludes the remote procedure call component of the lambda library
# which reduces the binary size
go build -tags lambda.norpc -o ./dist/main main.go
cd ./dist
build-lambda-zip -output main.zip main