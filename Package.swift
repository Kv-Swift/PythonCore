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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libpython3.11.zip",
            checksum: "247c351b206a6ae5f69725d5cd5947f1de0b830ed82de2471f9e48951a7a9531"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libssl.zip",
            checksum: "4a4ec118fa322f4f2fb59ef837037b204447369d606bdc479741e9a2d3d16f47"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libcrypto.zip",
            checksum: "78601a55df77ebb5b918459955cf1c2885fa2580a4ce5bae735a3be188ca3495"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libffi.zip",
            checksum: "c8eebe57085b116afda02c3a09dfa1810959926ca913c667be9aaf4e03b450ab"
        )
    ]
)

