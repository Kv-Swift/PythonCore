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
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.16/libpython3.11.zip",
            checksum: "8a5bcae0870b1f02ec3f3c497689855d3aa678f82e578f185ad532d2bdeddcd0"
        ),
        .binaryTarget(
            name: "libssl",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.16/libssl.zip",
            checksum: "b945b565bbbf3453b2cbf7181f6fa1d267240cb935791dac89658aa19debddce"
        ),
        .binaryTarget(
            name: "libcrypto",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.16/libcrypto.zip",
            checksum: "2e50a378ce450e6316839d8de9f288c0ce9e5390db492ac5159fd2708bbe05a5"
        ),
        .binaryTarget(
            name: "libffi",
            url: "https://github.com/kv-swift/PythonCore/releases/download/311.1.16/libffi.zip",
            checksum: "dddc362131100483942c167438e339c03d58ccc148c7359888c584869683c54c"
        )
    ]
)

