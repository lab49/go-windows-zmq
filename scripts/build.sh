
export CGO_CFLAGS='-IC:/dev/vcpkg/installed/x64-windows/include'
export CGO_LDFLAGS='-LC:/dev/vcpkg/installed/x64-windows/lib'

CGO_ENABLED=1 go build -v -o bin/gozmqdemo cmd/gozmqdemo/main.go

cp C:/dev/vcpkg/installed/x64-windows/bin/libczmq.dll bin/
cp C:/dev/vcpkg/installed/x64-windows/bin/libsodium.dll bin/
cp C:/dev/vcpkg/installed/x64-windows/bin/libzmq*.dll bin/
