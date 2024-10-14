
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.1/libssl.zip", checksum: "0459408e8da8866ec31145d7b9b952c2e6d5e6a33b1781391772052708487dfa"),
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.1/libcrypto.zip", checksum: "5a1673a45b57cb383d0d5369e0f28e14c90a19ce32da948d9a9d5e7fe208fe08"),
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.1/libpython311.zip", checksum: "63b5957b31ad023bd421e67b7ce120d2b6b83cdf5a850f4a694976cd43dea802"),
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.1/libffi.zip", checksum: "18d546709520b79d1ebf9f514febf8408a8a1dc56d004793e4e4a79371f92748"),
    ]

)