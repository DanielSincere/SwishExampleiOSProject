import XCTest
@testable import App

final class GreetingTests: XCTestCase {

  func testGreeting() {

    XCTAssertEqual(SwishExampleApp.greeting, "Hello world")
  }
}
