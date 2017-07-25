// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "RAML-Swift-CLI",
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/cpageler93/RAML-Swift", "0.5.0"),
        .Package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", "0.5.0")
    ]
)
