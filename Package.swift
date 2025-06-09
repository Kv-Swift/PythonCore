// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "PythonCore",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PythonCore", targets: ["PythonCore", "libpython3.11"]), .library(name: "PythonLibrary", targets: ["PythonLibrary"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PythonCore",
            dependencies: [
        		"libpython3.11",
        		.target(name: "libssl", condition: .when(platforms: [.iOS])),
        		.target(name: "libcrypto", condition: .when(platforms: [.iOS])),
        		.target(name: "libffi", condition: .when(platforms: [.iOS]))
        	],
            resources: [
        	],
            linkerSettings: [
        		.linkedLibrary("z"),
        		.linkedLibrary("bz2"),
        		.linkedLibrary("sqlite3"),
        		.linkedLibrary("ncurses", .when(platforms: [.macOS]))
        	],
            plugins: []
        ),
        .target(
            name: "PythonLibrary",
            dependencies: [
        	],
            resources: [
        		.copy("lib")
        	],
            linkerSettings: [
        	],
            plugins: []
        ),
        .binaryTarget(
            name: "libpython3.11",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.17/libpython3.11.zip",
            checksum: "9953c1033564e47c365417aba0681ab43f16e0333f9f0ab4849881a4913ef74c"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.17/libssl.zip",
            checksum: "a7b5c147c839b39bc6f746da724ebeb8626b4071c1c3af7374e57fc2f0e0385f"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.17/libcrypto.zip",
            checksum: "b8f236a93c40a67a8a212ca0ff4145ef6caffea400f53315dd9eee483b0303e9"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.17/libffi.zip",
            checksum: "673140e28fa95885c8f5131964e716b964c2ee68f63fb56b593e9812b085d595"
        )
    ]
)

