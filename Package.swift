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
        		"libpython3.11",
        		"libssl",
        		"libcrypto",
        		"libffi"
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedLibrary("z"),
        		.linkedLibrary("bz2"),
        		.linkedLibrary("sqlite3"),
        		.linkedLibrary("ncurses")
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
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.15/libpython3.11.zip",
            checksum: "5db50a1ca59cccf238d8b39d6e3a4c601074836229a606a4c98b600b77c1696f"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.15/libssl.zip",
            checksum: "378554db386e57bb13fe1ba080a6be41b731df01c7dcc445a54169620cd9559e"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.15/libcrypto.zip",
            checksum: "a08e98047353710e144f278d9bf2f0d4a32245ce33c280dbafeac6d4787c988a"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.15/libffi.zip",
            checksum: "64057a2c1698ad093060b5d761b7e1ec29592c64cc3bd1933af8c5511703de9d"
        )
    ]
)

