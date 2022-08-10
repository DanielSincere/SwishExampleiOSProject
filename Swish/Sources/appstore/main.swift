import Foundation
import Sh
import ShXcrun
import Secrets

let artifactRoot = "tmp/artifacts"
let logRoot = "tmp/logs"

try sh(.terminal, "rm -fr \(logRoot)")
try sh(.terminal, "mkdir -p \(logRoot)")
try sh(.terminal, "rm -fr \(artifactRoot)")
try sh(.terminal, "mkdir -p \(artifactRoot)")

let archivePath = "\(artifactRoot)/App.xcarchive"
let exportOptionsPath = "\(artifactRoot)/exportOptions.plist"
let exportOptions = ExportOptions(compileBitcode: true,
                                  manageAppVersionAndBuildNumber: true,
                                  method: .appStore,
                                  teamID: try Secrets.developmentTeam.get(),
                                  uploadBitcode: true,
                                  uploadSymbols: true)
try exportOptions.write(to: exportOptionsPath)

let xcodebuild = Xcodebuild(scheme: "App",
                            sdk: "iphoneos",
                            allowProvisioningUpdates: true,
                            allowProvisioningDeviceRegistration: true)
try xcodebuild.archive(.file("\(logRoot)/archive.log"), path: archivePath)
try xcodebuild.exportArchive(.file("\(logRoot)/exportArchive.log"),
                             archivePath: archivePath,
                             exportPath: artifactRoot,
                             exportOptionsPlistPath: exportOptionsPath)

let altool = Altool(credential: .api(keyID: try Secrets.apploaderApiKeyID.get(),
                                     issuerID: try Secrets.apploaderApiIssuerID.get()))

try altool.uploadApp(.file("\(logRoot)/upload.log"),
  file: "\(artifactRoot)/App.ipa",
  platform: .iOS)
