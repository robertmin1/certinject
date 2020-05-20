set -ex
go get -v -u -t ./...
go build -o certinject.exe ./cmd/certinject
powershell -ExecutionPolicy Unrestricted -File "testdata/ci-failtest.ps1"
./certinject.exe -conf testdata/test.conf
go test -v ./...
