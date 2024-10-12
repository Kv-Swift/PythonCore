
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/0.0.10/libssl.zip", checksum: "013bff97047839d9d4373185cc4b4d0aa79e716a0fe7c861b78800734ed3f2ac"),
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/0.0.10/libcrypto.zip", checksum: "877ce0f8b723b4fca07c64b224d282cf863e9f6934977526f7ef5e0055bb1d1d"),
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/0.0.10/libpython311.zip", checksum: "f14f010c9b203374a8dbe12099473e501f35feda7d0716c41d7fbc35196bc62c"),
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/0.0.10/libffi.zip", checksum: "533fd5e6b8031557a9b2b85dba89b1a4c23c9d7f4cff2092f75216db9eb75220"),
    ]

)