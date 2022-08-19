import Foundation

let contents =
"""
let subtitle = "The subtitle!"
"""

guard let projectDir = ProcessInfo.processInfo.environment["PROJECT_DIR"] else {
  fatalError("Could not load PROJECT_DIR env var")
}

try contents
  .data(using: .utf8)!
  .write(to: URL(fileURLWithPath: "\(projectDir)/App/subtitle.swift"))
