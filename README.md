# Reproducer Project: spotify/ios-sdk v1.2.5 Umbrella Header Warnings

This project demonstrates an issue in [spotify/ios-sdk](https://github.com/spotify/ios-sdk) whereby the `SpotifyiOS.xcframework` contained in the [v1.2.5 release](https://github.com/spotify/ios-sdk/releases/tag/v1.2.5) generates umbrella header warnings in a fresh Xcode project.

This project was created to add context and reproduction steps to the [GitHub Issue opened here](https://github.com/spotify/ios-sdk/issues/418).

## Configuration

These results were validated using the following configuration:

- Host machine:
    - Model: 16-inch MacBook Pro (2023)
    - CPU: Apple M3 Max
    - RAM: 64 GB
    - OS: macOS Sonoma 14.3
- Dependecies:
    - Xcode: 15.2

## Setup

This reproducer project uses [bazelbuild/bazelisk](https://github.com/bazelbuild/bazelisk) and [yonaskolb/XcodeGen](https://github.com/yonaskolb/XcodeGen) to create an Xcode project demonstrating the issue detailed below.

The following command can be used to generate and open the Xcode project:
```
make xcodegen_project
```

## Issue

### Expected Outcome

Building the iOS Application target should produce no warnings / errors when linking to / importing the `SpotifyiOS` module.

### Actual Outcome

Building the iOS Application target produces the following umbrella header warnings:

```
<module-includes>:1:9: note: in file included from <module-includes>:1:
#import "Headers/SpotifyiOS.h"
        ^
/Users/connorwybranowski/Library/Developer/Xcode/DerivedData/XcodegenProject-djterbzbcajjghauytowisaxzrmg/Build/Products/Debug-iphonesimulator/SpotifyiOS.framework/Headers/SpotifyiOS.h:8:1: warning: umbrella header for module 'SpotifyiOS' does not include header 'SPTAppRemoteConnectivityState.h'

^
<module-includes>:1:9: note: in file included from <module-includes>:1:
#import "Headers/SpotifyiOS.h"
        ^
/Users/connorwybranowski/Library/Developer/Xcode/DerivedData/XcodegenProject-djterbzbcajjghauytowisaxzrmg/Build/Products/Debug-iphonesimulator/SpotifyiOS.framework/Headers/SpotifyiOS.h:8:1: warning: umbrella header for module 'SpotifyiOS' does not include header 'SPTAppRemoteConnectivityAPI.h'

^
```
