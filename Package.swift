
// swift-tools-version: 5.8

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
    ], 
    targets: [
    	.target(
        	name: "PythonCore", 
        	dependencies: [
        		"libssl", 
        		"libcrypto", 
        		"libpython311", 
        		"libffi", 
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
        	name: "PythonLibrary", 
        	dependencies: [
        	], 
        	resources: [
        	.copy("lib.zip")
        	], 
        	linkerSettings: [
        	]
    	), 
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libssl.zip", checksum: "810e1dd9c8f572831bd194ac88c760d387eea5b3d9584b0444b3c32be590db1c"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libcrypto.zip", checksum: "5c95afede75a47840bb85dd7b40536b2dc1917b2f63cdb5384c0716a97f98f01"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libpython311.zip", checksum: "7e1baf7ea6f4e5b57dec60b9e909559ed1e451e7b0cfb7384923d28c06316c31"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.2/libffi.zip", checksum: "fc9d1c163b267dc811adc7dcfcb404856e098e75bb8975334c5efbbdf8a393e4"), 
    ]
)