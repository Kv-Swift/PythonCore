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
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.20/libpython3.11.zip",
            checksum: "f808fb79717143175a6be3f43a80079202fdf60f94e1b4d521fdd7a7426368ec"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.20/libssl.zip",
            checksum: "a5601464fa5ffb168f44220f7ee80303891a57e836eea10c9cc071b37994d587"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.20/libcrypto.zip",
            checksum: "e99503c5e475c27ba59d0c4fefcb0997e903c537ba0f40d4031c333bf177f439"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.20/libffi.zip",
            checksum: "ee963e4d7e59bb46494d3736db630f80b3ed7c45151fab672d6a1c1d44349015"
        )
    ]
)

