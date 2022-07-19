import ProjectDescription

let projectSettings = Settings.settings(
    configurations: [
        Configuration.debug(
            name: "Debug",
            xcconfig: Path("config/NetworkKitProject.xcconfig")
        ),
        Configuration.release(
            name: "Release",
            xcconfig: Path("config/NetworkKitProject.xcconfig")
        )
    ],
    defaultSettings: .none
)

let targetSettings = Settings.settings(
    configurations: [
        Configuration.debug(
            name: "Debug",
            xcconfig: Path("config/NetworkKitTarget.xcconfig")
        ),
        Configuration.release(
            name: "Release",
            xcconfig: Path("config/NetworkKitTarget.xcconfig")
        )
    ],
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
            bundleId: "com.simon.MovieInfo.NetworkKit",
            infoPlist: "NetworkKit/Info.plist",
            sources: ["NetworkKit/Source/**"],
            settings: targetSettings
        )
    ]
)
