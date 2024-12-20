// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PythonCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PythonCore", targets: ["PythonCore"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PythonCore",
            dependencies: [
        		"PythonLibrary",
        		"libpython3.11",
        		"libssl",
        		"libcrypto",
        		"libffi"
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedLibrary("libz"),
        		.linkedLibrary("libbz2"),
        		.linkedLibrary("libsqlite3")
        	]
        ),
        .target(
            name: "PythonExtra",
            dependencies: [
        		"libpython3.11"
        	],
            resources: [
        	],
            linkerSettings: [
        	]
        ),
        .target(
            name: "PythonLibrary",
            dependencies: [
        	],
            resources: [
        		.copy("lib")
        	],
            linkerSettings: [
        	]
        ),
        .binaryTarget(
            name: "libpython3.11",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.6/libpython3.11.zip",
            checksum: "b75f0c0d9ae9b62c453c0deacc35e903c823495913572718f394f185f5b0af9f"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.6/libssl.zip",
            checksum: "35736f06f90a8120649c8900fb8185609bc27ba16d20a7c8ab423bf52cb66bfc"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.6/libcrypto.zip",
            checksum: "190c5de9ab0ae728b3779168cc2dd82a5a51ec6e063810e58fa2526bcdb85d45"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.6/libffi.zip",
            checksum: "890bf2deb085fe858a8d356ec57d3e36a60422b1b20b3b2d57574e366aee6863"
        )
    ]
)

