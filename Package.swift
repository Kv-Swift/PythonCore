
// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "KivyPythonCore", 
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
        	.copy("lib")
        	], 
        	linkerSettings: [
        	]
    	), 
    	.binaryTarget(name: "libssl", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.0/libssl.zip", checksum: "cbc9da83c2d0461398fa0c03b0f823371b37759b0f2ac1eb37d6b6f3d1566619"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.0/libcrypto.zip", checksum: "7a8e901e8e48c7c1baff4876ae7dd76f1eb68bcffb1e2cb00fde4ee07f085a5b"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.0/libpython311.zip", checksum: "03a8cc2348e08dda39e958953ecf2bd462a657590ea2241284ab5c6d726144a6"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/PythonSwiftLink/KivyPythonCore/releases/download/311.0.0/libffi.zip", checksum: "96073785096ef6c2320f8d09841c51f31e294c088b91c614cf2b828be859effb"), 
    ]
)