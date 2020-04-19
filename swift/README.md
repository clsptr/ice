# Building Ice for Swift
This file describes how to build Ice for Swift from source and how to test the
resulting build.

* [Build Requirements](#build-requirements)
  * [Operating Systems](#operating-systems)
  * [Slice to Swift Compiler](#slice-to-swift-compiler)
  * [Swift Version](#swift-version)
* [Building Ice for Swift](#building-ice-for-swift)
* [Running the Swift Test Suite](#running-the-swift-test-suite)
  * [macOS](#macos)
  * [iOS](#ios)

## Swift Build Requirements

### Operating Systems

Ice for Swift builds and runs on macOS and is supported on the platforms listed
on the [supported platforms][2] page.

### Slice to Swift Compiler

You need the Slice to Swift compiler to build Ice for Swift and also to use Ice
for Swift. The Slice to Swift compiler (`slice2swift`) is a command-line tool
written in C++. You can build the Slice to Swift compiler from source, or
alternatively you can install an Ice [binary distribution][1] that includes this
compiler.

### Swift Version

Ice for Swift requires Swift 5 or later.

### Carthage

Carthage must be installed to build Ice for Swift. You can install Carthage
using Homebrew:
```
brew install carthage
```

## Building Ice for Swift

First download and build the PromiseKit framework by running:
```
carthage update
```
from the root directory of your ice repository.

Then open `ice.xcodeproj` with Xcode and build the `Ice macOS` or `Ice iOS`
targets.

The test programs for macOS and iOS can be built using `TestDriver macOS` and
`TestDriver iOS` respectively.

## Running the Swift Test Suite

Python is required to run the test suite.

### macOS

After a successful build, you can run the tests as follows:

```
python allTests.py --config Debug
```

If everything worked out, you should see lots of `ok` messages. In case of a
failure, the tests abort with `failed`.

### iOS

Start the `TestDriver iOS` application on your iOS device or simulator, from
Xcode.

Then on your mac, run:
```
python allTests.py --config Debug --platform iphoneos
```
or
```
python allTests.py --config Debug --platform iphonesimulator
```
depending on your target.

[1]: https://zeroc.com/downloads/ice
[2]: https://doc.zeroc.com/ice/3.7/release-notes/supported-platforms-for-ice-3-7-3
