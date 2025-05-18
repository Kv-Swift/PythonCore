// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PythonCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PythonCore", targets: ["PythonCore", "libpython3.11", "libssl", "libcrypto", "libffi"]), .library(name: "PythonLibrary", targets: ["PythonLibrary"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PythonCore",
            dependencies: [
        		"PythonExtra",
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
        		.linkedLibrary("sqlite3")
        	],
            plugins: []
        ),
        .target(
            name: "PythonExtra",
            dependencies: [
        		"libpython3.11"
        	],
            resources: [
        	],
            linkerSettings: [
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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.3/libpython3.11.zip",
            checksum: "ca9466d649d85aff5d1c027819d4a1f88ad8680113de2303061855788aa22763"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.3/libssl.zip",
            checksum: "c634a68c3da0de8de4945c2eb8f56c422b60998267f14cf13baa597e627ac266"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.3/libcrypto.zip",
            checksum: "6dbc9eac68db0e0523d920c6f3c3fc779338e20de531ba2b32f290ff228ad99d"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.3/libffi.zip",
            checksum: "9d1ca9f6aaac2f99d35b7940a13e506278e2f1cd0dfcdcdf68fb4f2394a637b8"
        )
    ]
)

