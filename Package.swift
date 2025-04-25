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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.0/libpython3.11.zip",
            checksum: "e78fdc7cdec747ad8478079e2c004df72a76dc9c27562c0596d412c6eb545a5b"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.0/libssl.zip",
            checksum: "f2168406c9f2fd49322e2abaf4d4cfd22c42d54743a3fd2f870a7addd6a73434"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.0/libcrypto.zip",
            checksum: "20adcdb494b21ae568bd099b8ef1bc97ddfee850d46f10085385009c36875596"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.1.0/libffi.zip",
            checksum: "76b8e028fc12b6cc02add22d6133f887b62baf12bfbc32ed2719f96b40178459"
        )
    ]
)

