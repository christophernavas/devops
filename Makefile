start: 
  go run
test:
cd handler && go test && cd ..

build: test
  go build

infra:
  terraform apply
