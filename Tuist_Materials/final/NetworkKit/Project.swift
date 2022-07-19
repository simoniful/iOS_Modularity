import ProjectDescription

let projectSettings = Settings(
  debug: Configuration(xcconfig: Path("config/NetworkKitProject.xcconfig")),
  release: Configuration(xcconfig: Path("config/NetworkKitProject.xcconfig")),
  defaultSettings: .none
)

let targetSettings = Settings(
  debug: Configuration(xcconfig: Path("config/NetworkKitTarget.xcconfig")),
  release: Configuration(xcconfig: Path("config/NetworkKitTarget.xcconfig")),
  defaultSettings: .none
)

let project = Project(
  name: "NetworkKit",
  organizationName: "Ray Wenderlich",
  settings: projectSettings,
  targets: [
    Target(
      name: "NetworkKit",
      platform: .iOS,
      product: .framework,
      bundleId: "com.raywenderlich.networkkit",
      infoPlist: "NetworkKit/Info.plist",
      sources: ["NetworkKit/Source/**"],
      settings: targetSettings
    )
  ]
)
