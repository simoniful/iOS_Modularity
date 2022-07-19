import ProjectDescription

let swiftlint = """
  PATH=/opt/homebrew/bin:$PATH
  if [ -f ~/com.raywenderlich.swiftlint.yml ]; then
    if which swiftlint >/dev/null; then
      swiftlint --no-cache --config ~/com.raywenderlich.swiftlint.yml
    fi
  fi
  """

let projectSettings = Settings(
  debug: Configuration(xcconfig: Path("config/MovieInfoProject.xcconfig")),
  release: Configuration(xcconfig: Path("config/MovieInfoProject.xcconfig")),
  defaultSettings: .none
)

let targetSettings = Settings(
  debug: Configuration(xcconfig: Path("config/MovieInfoTarget.xcconfig")),
  release: Configuration(xcconfig: Path("config/MovieInfoTarget.xcconfig")),
  defaultSettings: .none
)

let project = Project(
  name: "MovieInfo",
  organizationName: "Ray Wenderlich",
  packages: [
    Package.remote(
      url: "https://github.com/kean/FetchImage.git",
      requirement: .upToNextMajor(
        from: Version(0, 4, 0)
      )
    )
  ],
  settings: projectSettings,
  targets: [
    Target(
      name: "MovieInfo",
      platform: .iOS,
      product: .app,
      bundleId: "com.raywenderlich.movieinfo",
      infoPlist: "MovieInfo/Info.plist",
      sources: ["MovieInfo/Source/**"],
      resources: ["MovieInfo/Resources/**"],
      actions: [
        .pre(script: swiftlint, name: "SwiftLint")
      ],
      dependencies: [
        .project(
          target: "NetworkKit",
          path: .relativeToManifest("NetworkKit")
        ),
        .package(product: "FetchImage")
      ],
      settings: targetSettings
    ),
    Target(
      name: "MovieInfoTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "com.raywenderlich.movieinfotests",
      infoPlist: "MovieInfoTests/Resources/Info.plist",
      sources: ["MovieInfoTests/Source/**"],
      dependencies: [
        .target(name: "MovieInfo")
      ]
    )
  ]
)
