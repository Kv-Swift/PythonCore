
// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PythonCore",
    platforms: [.iOS(.v13)],
    products: [
    	.library(
        	name: "PythonCore",
        	targets: [
        		"PythonCore",
        "libpython311",
        "libssl",
        "libcrypto",
        "libffi"
        	]
    	),
    	.library(
        	name: "PythonLibrary",
        	targets: [
        		"PythonLibrary"
        	]
    	),
    ],
    dependencies: [
    ], targets: [
    	.target(
        	name: "PythonCore",
        	dependencies: [
        		"libssl",
        		"libcrypto",
        		"libpython311",
        		"libffi",
        		"PythonExtra",
        	],
        	resources: [
        	],
        	linkerSettings: [
        		.linkedLibrary("bz2"),
        		.linkedLibrary("z"),
        		.linkedLibrary("ncurses"),
        		.linkedLibrary("sqlite3"),
        	]
    	),
    	.target(
        	name: "PythonExtra",
        	dependencies: [
        		"libpython311",
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libssl.zip", checksum: "227a68b28550af5af8018219d94c2c58180296df8aad211417e253d022358eb4"),
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libcrypto.zip", checksum: "550f1f522c05cde9202c1b4c73a7f825d33652664991a907f93c96224b0d2ca4"),
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libpython311.zip", checksum: "093b646541e97dfa11b0f2e1d357c512909145399683afed47ae4f889e20ef15"),
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libffi.zip", checksum: "f02859501ef5c4cbc673159424594b5b6fc76a214a566a366d7e5736b99f91cb"),
    ]

)