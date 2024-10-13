
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.13/libssl.zip", checksum: "127557fb696e6b674b6b03838fdfd5fe417eec9159900b6dc12f7d60697824ef"),
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.13/libcrypto.zip", checksum: "3b7c2ba0302da9e6679adf5b54f0d683e30d0f4de1584f5d1c16fc44888dd8bd"),
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.13/libpython311.zip", checksum: "f89a7e1481eeb6f93e6aa2c5f6f0a932b87e3c071f2e67a4e6e73610a5caa903"),
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.13/libffi.zip", checksum: "c854307f346b7a14511ef6fea5d55c3c371173be883af92ac815b293c4b97769"),
    ]

)