start: go run main.go

test: 
	cd handler && go test 

build: test
	go build main.go

infra: 
	cd provisions && terraform apply
