// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PythonCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PythonCore", targets: ["PythonCore", "libpython3.11"]), .library(name: "PythonLibrary", targets: ["PythonLibrary"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PythonCore",
            dependencies: [
        		.target(name: "libpython3.11"),
        		.target(name: "libssl", condition: .when(platforms: [.iOS])),
        		.target(name: "libcrypto", condition: .when(platforms: [.iOS])),
        		.target(name: "libffi", condition: .when(platforms: [.iOS]))
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedLibrary("z"),
        		.linkedLibrary("bz2"),
        		.linkedLibrary("sqlite3"),
        		.linkedLibrary("ncurses", .when(platforms: [.macOS]))
        	],
            plugins: []
        ),
        .target(
            name: "PythonLibrary",
            dependencies: [
        	],
            resources: [
        		.copy("lib")
        	],
            linkerSettings: [
        	],
            plugins: []
        ),
        .binaryTarget(
            name: "libpython3.11",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.19/libpython3.11.zip",
            checksum: "c2730d78876aca18d752637439736855b39a57955dba7422d82d942c59991834"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.19/libssl.zip",
            checksum: "2c3b5eb2106b1749ae9247cc22e8238932bbf47b8070d7bafc925c024e534ca4"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.19/libcrypto.zip",
            checksum: "354bf0156ca60d4ed3779c90f6be53805a0db572bc9e82dc4a5f0a9cbbbcaaf7"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.19/libffi.zip",
            checksum: "f193697f7ce2728c3ce71e9b9440084166e16438036627dcfb125b2e5e849b89"
        )
    ]
)

