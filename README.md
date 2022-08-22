# Swish full example app

This is an example of how to use [Swish](https://github.com/FullQueueDeveloper/Swish), [Sh](https://github.com/FullQueueDeveloper/Sh), [ShXcrun](https://github.com/FullQueueDeveloper/ShXcrun) for your iOS projects.

There are example scripts for generating an `.xcodeproj` using [XcodeGen](https://github.com/yonaskolb/XcodeGen), generating an `xcassets` with an App Icon from an `svg` file using [Inkscape](https://inkscape.org), and of course for building your iOS app and uploading it to the App Store.

The app is a simple "Hello world" app in SwiftUI.

## Setup

There are two dependencies in the `Brewfile`: [Mint](https://github.com/yonaskolb/Mint) and [Inkscape](https://inkscape.org)

1. `brew bundle`
2. `mint bootstrap`
3. `swish icon`
4. `swish project`
5. And if this was a real app `swish appstore`

## `swish icon`

Renders `Art/AppIcon.svg` to a complete App Icon.

It renders an SVG to each of the sizes for an App Icon. It then also renders the JSON and folder structure an an `.xcassets`.

## `swish project`

Creates an `xcodeproj` file from `xcodegen.yml` using [XcodeGen](https://github.com/yonaskolb/XcodeGen).

It uses fake secrets from the `Secrets` target.

## `swish appstore`

Build and deploy an iOS to the App Store.

First it creates 2 tempory folders for logs and build artifacts.

Then it creates an export options `plist` and saves to the build artifacts folder.

Then it archives the app using `xcodebuild`.

Then it exports the app for the App Store using the export options plist using `xcodebuild`.

Finally, it uploads the resulting `.ipa` to the App Store using `altool`.

## `swish generate`

As an example of code generation in an Xcode script phase using Swish, the `generate` target generates a new UUID every time it is run.
