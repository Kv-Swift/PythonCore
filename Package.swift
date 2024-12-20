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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libpython3.11.zip",
            checksum: "78814b9e3c5e2f284321e466f0896383768a82c8c5d8c2235d1159ad7597b74e"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libssl.zip",
            checksum: "6c350a282e616573f1a9c5cb7881296460ab5f83210c38a31959d7b969e95025"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libcrypto.zip",
            checksum: "03e5285a431cab07215bc69111d3f789bbd95d9f4309d527401213a70fa836a1"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.5/libffi.zip",
            checksum: "bb7ee2294dc643859c3ad9b172dc439d4d2d1d093c791aa981ae74fdf9492230"
        )
    ]
)

