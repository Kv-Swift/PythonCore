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
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.21/libpython3.11.zip",
            checksum: "35495d05897fc65407dc2937f8772117c39378eb0b2b4cf6eea8c89ad5981150"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.21/libssl.zip",
            checksum: "111d99bb3856069c43d37359ffd1d5867763ee90c6884daa46c8e1bbef663fac"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.21/libcrypto.zip",
            checksum: "088286f3f0e9bbdc12faf061be93564860f01a2179b216e5faf875389fcffe90"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.21/libffi.zip",
            checksum: "b9e9244df34f6d5974323dcbd0b8b7e20d4a8846bad49146570d8e65593f4824"
        )
    ]
)

