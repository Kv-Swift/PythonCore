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
        		.linkedLibrary("libz"),
        		.linkedLibrary("libz"),
        		.linkedLibrary("libbz2"),
        		.linkedLibrary("libsqlite3")
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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libpython3.11.zip",
            checksum: "d0005fe40ecec48e393f35b0ad4dd42560a68b94d6d8cb4b760667b4816fcbc1"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libssl.zip",
            checksum: "988d28ec5b63504d6ba5e664fe69310e2b3df13d03684e6277ed5f45c37b06fe"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libcrypto.zip",
            checksum: "d4121429095ab57cb28014321b55b6e139d3936350c3d9624760a601325b76c7"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libffi.zip",
            checksum: "a58ff4a2aff8b737cc2ef71fcd39ec1b69453c8c981ec04ced0d76af1587a155"
        )
    ]
)

