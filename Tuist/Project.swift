import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains Tuist App target and Tuist unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project
let projectName = "Tuist"
let bundleID = "com.simon.Tuist"
let iOSTargetVersion = "13.0"


// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "Tuist",
//                          platform: .iOS,
//                          additionalTargets: ["TuistKit", "TuistUI"])
let project = Project(
    name: projectName,
    organizationName: "simon",
    packages: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.5.0"))
    ],
    settings: nil,
    targets: [
        Target(
            name: projectName,
            platform: .iOS,
            product: .staticFramework,
            bundleId: bundleID,
            deploymentTarget: .iOS(
                targetVersion: iOSTargetVersion,
                devices: [.iphone]
            ),
            infoPlist: .default,
            sources: ["Targets/\(projectName)/Sources/**"],
            resources: [],
            dependencies: [
                .package(product: "RxSwift"),
                .package(product: "RxCocoa")
            ]
        )
    ],
    schemes: [
        Scheme(name: "\(projectName)-Debug"),
        Scheme(name: "\(projectName)-Release")
    ],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    resourceSynthesizers: []
)
