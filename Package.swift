
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
        		"Info", 
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
    	.binaryTarget(name: "libssl", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libssl.zip", checksum: "933e8805d114cbb37c43d381899c148afc914ce57b01bb82402877d06a673066"), 
    	.binaryTarget(name: "libcrypto", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libcrypto.zip", checksum: "9ccff3761f9b1c653959c6265b5a12f0da0319d7857d57368d58ffbea97544de"), 
    	.binaryTarget(name: "libpython311", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libpython311.zip", checksum: "6ca0cd35734002b440d065c6483e62f507ebd0563820dc7cc0ad779194a1a40a"), 
    	.binaryTarget(name: "libffi", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/libffi.zip", checksum: "4b4e0302399f0e016c61cc88f70ce6188a120e90ad4018ee63ca04cafc2e2556"), 
    	.binaryTarget(name: "Info", url: "https://github.com/KivySwiftLink/PythonCore/releases/download/311.0.3/Info.zip", checksum: "e620633fd6e91a6d85388f2c319a42ed8e41dfaa9618668a6993604434fb1bc0"), 
    ]
)