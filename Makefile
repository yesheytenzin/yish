build:
	@go build -o ./bin/shellgo app/main.go

test:
	@go test -v ./...

run: build
	@./bin/shellgo
