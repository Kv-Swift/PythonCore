
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
        		"PythonExtra"
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
        		"libpython311"
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libssl.zip", checksum: "b69de71134ebccf6180a1529c6329e918e4836b83962ebd7c6787fa745f73fc2"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libcrypto.zip", checksum: "fc614f520795216d7379ff5c57ec6223ebfb30bc324cf54c067d7dedb8ebeb71"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libpython311.zip", checksum: "ff9814dc8e4f4d435a25b0d48f2ad18f3b0c4e7faacbc6f07931c529778c88a8"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.0/libffi.zip", checksum: "b93ee61cc1c4e2ba82baee0cb57fc0c74ccd43108b02b7a7112fb2be0c2cbd54"), 
    ]
)