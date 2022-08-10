import Sh
import Secrets

try sh(.terminal,
"mint run -m Mintfile yonaskolb/Xcodegen xcodegen -s xcodegen.yml",
environment: [
  "SWISH_EXAMPLE_BUNDLE_ID": "com.fullqueuedeveloper.SwishExampleApp",
  "SWISH_EXAMPLE_DEVELOPMENT_TEAM": try Secrets.developmentTeam.get(),
])
