import SwiftUI

@main
struct SwishExampleApp: App {

  static let greeting = "Hello world"

  var body: some Scene {
    WindowGroup {
      Text(Self.greeting)
      Text(subtitle)
    }
  }
}
