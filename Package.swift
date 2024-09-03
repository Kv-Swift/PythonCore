
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libssl.zip", checksum: "af19891270ddebb5d398544470f27ba6b7269e7fcfc12e89e3fb668885a7c75f"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libcrypto.zip", checksum: "d5564b8ec0f611ec700b440ef04f1584f230f0fe683d75c4373336b74f521cf8"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libpython311.zip", checksum: "14c7f85f93d0934b7adc4e164f6925f314c5b8bb86e7422b6de71ed0902c2def"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libffi.zip", checksum: "202f10bc7f69896ce7c88ad9a645cd2074290112f0c221dbe753d4649c3bc7f6"), 
    ]
)