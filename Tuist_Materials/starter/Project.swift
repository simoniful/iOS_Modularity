import ProjectDescription

// 1
let projectSettings = Settings.settings(
    configurations: [
        Configuration.debug(
            name: "Debug",
            xcconfig: Path("config/MovieInfoProject.xcconfig")
        ),
        Configuration.release(
            name: "Release",
            xcconfig: Path("config/MovieInfoProject.xcconfig")
        )
    ],
    defaultSettings: .none
)

let targetSettings = Settings.settings(
    configurations: [
        Configuration.debug(
            name: "Debug",
            xcconfig: Path("config/MovieInfoTarget.xcconfig")
        ),
        Configuration.release(
            name: "Release",
            xcconfig: Path("config/MovieInfoTarget.xcconfig")
        )
    ],
    defaultSettings: .none
)

let project = Project(
    name: "MovieInfo",
    organizationName: "simon",
    packages: [
        .remote(
            url: "https://github.com/kean/Nuke.git",
            requirement: .upToNextMajor(
                from: Version(10, 0, 0)
            )
        )
    ],
    settings: projectSettings,
    targets: [
        Target(
            name: "MovieInfo",
            platform: .iOS,
            product: .app,
            bundleId: "com.simon.MovieInfo",
            infoPlist: "MovieInfo/Info.plist",
            sources: ["MovieInfo/Source/**"],
            resources: ["MovieInfo/Resources/**"],
            dependencies: [
                .project(
                    target: "NetworkKit",
                    path: .relativeToManifest("NetworkKit")
                ),
                .package(product: "Nuke")
            ],
            settings: targetSettings
        ),
        Target(
            name: "MovieInfoTests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "com.simon.MovieInfo",
            infoPlist: "MovieInfoTests/Resources/Info.plist",
            sources: ["MovieInfoTests/Source/**"],
            dependencies: [
                .target(name: "MovieInfo")
            ])
    ]
)
