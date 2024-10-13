
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libssl.zip", checksum: "27d7dbac34b15d5275e397313beca1d0b8829c90abce7d4a31f8c48d53c32eaf"),
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libcrypto.zip", checksum: "dcde7e19f2fed2831e72c3011f3a26960a74f0ddaaf648fff8da60c4c00c37ed"),
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libpython311.zip", checksum: "a9da3d9dde1a9b888ccae332f973c9c0455c2a6813f37c4285575bc949e0a66c"),
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libffi.zip", checksum: "725b8699a9d2c8f5201c6182606e5a8c34af785bc5377e15d8f1a6cdf035fd80"),
    ]

)