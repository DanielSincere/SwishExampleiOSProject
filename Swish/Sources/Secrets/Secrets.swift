import Sh

public enum Secrets: String {

  /*
  This is an example. In a real-life situation, you
  probably want to retrieve from a secrets manager
  */

  case developmentTeam = "ARST1234"
  case apploaderApiKeyID = "example-apploaderApiKeyID"
  case apploaderApiIssuerID = "example-apploaderApiIssuerID"

  public func get() throws -> String {
    if let secret = try sh("echo \"\(self.rawValue)\"") {
      return secret
    } else {
      throw SecretNotFoundError(secret: self)
    }
  }

  public struct SecretNotFoundError: Error {
    public let secret: Secrets
  }
}
