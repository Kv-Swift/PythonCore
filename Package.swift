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
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libpython3.11.zip",
            checksum: "5ecf0bbe6ccf8a912908bded5bd07b18ae3f960fc67fa2a178684103875dfccd"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libssl.zip",
            checksum: "44069e82e1ffd28f8b4bb51aec5857e286e802d8da84a3415a5668a4668ddc50"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libcrypto.zip",
            checksum: "3457c887f2cf341f3e6a30a0a4b630ef531c9e4d165c6bfe9806632ce10323c2"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kivyswiftlink/PythonCore/releases/download/311.0.10/libffi.zip",
            checksum: "c9f33c29d4ed916b4521f927ca13e5d28578641fbc07aa2ad7b7872657b0b904"
        )
    ]
)

