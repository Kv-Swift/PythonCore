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
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.0.14/libpython3.11.zip",
            checksum: "d680a4db881c6ca39beb055e88b88981a01a30a1278b32306a4412dfa195397e"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.0.14/libssl.zip",
            checksum: "b8cfff99f9cffa4fb346aaa3629d11eefed6c3d79bb477728ecd69bce55e3a0b"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.0.14/libcrypto.zip",
            checksum: "36bcc32325c5a7465fd0c1e6f70e3822445907bc74e86c878b71e18a6e7e50c6"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.0.14/libffi.zip",
            checksum: "d995957ba3773de038a23b85249380661775272149f1863f8c87cbef80a864ad"
        )
    ]
)

