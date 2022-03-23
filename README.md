Go ZeroMQ Windows Demo
======================

A small demo to show that running ZeroMQ on Windows using Go is not that hard.

## Prerequisites

This demo requires that you have:

- [Gitbash](https://git-scm.com/downloads)
- [Go 1.18](https://go.dev/dl/)
    - Do yourself a favor and install gopls as well (`go install -v golang.org/x/tools/gopls@latest`)
- [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/)
- [Visual Studio 17 2022 with C/C++ Toolchain](https://visualstudio.microsoft.com/downloads/)
- [vcpkg](https://github.com/Microsoft/vcpkg) installed at the well-known `C:\dev\vcpkg` path
- [TDM-GCC](https://jmeubank.github.io/tdm-gcc/)


#### One-Time Setup

After installing vcpkg, go to the `C:/dev/vcpkg` path in gitbash and run the following install commands:

```bash
./vcpkg install zeromq[core,sodium]:x64-windows
./vcpkg install czmq[core]:x64-windows
cp installed/x64-windows/lib/libzmq-mt-4_3_4.lib installed/x64-windows/lib/zmq.lib
```

The `cp` step is necessary because libczmq expects libzmq to be referred to as `zmq` in lib. There should be no
problems caused by copying the file.

These steps are billed as one-time, but really they are _one-time per installing the c libraries_. Meaning, that if we
update versions here, we'll need to run these again.


## Building the Demo

After all the prerequisites are installed, from demo project root, please run the following command:

```bash
scripts/build.sh
```

Keep in mind that we are using CGO here, so all guarantees of the speedy-Go-compile time are thrown out the window. Go
will do its best to cache results when possible, but it is not guaranteed. We'll also have to keep in mind that, by
using CGO, we necessarily opt-out of Go's cross-compilation features. We will require access to every OS and architecture
for which we require support.


## Running the Binary

```bash
bin/gozmqdemo
```
