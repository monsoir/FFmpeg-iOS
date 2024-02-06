// swift-tools-version:5.3

import PackageDescription

let version = "v1.0.2"

let package = Package(
    name: "FFmpeg-iOS",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FFmpeg-iOS",
            targets: [
                "avcodec", "avutil", "avformat", "avfilter", "avdevice", "swscale", "swresample",
                "fftools", "Dummy",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/FFmpeg-iOS-Support", from: "0.0.1"),
    ],
    targets: [
        .binaryTarget(name: "avcodec", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avcodec.zip", checksum: "af84e002806200e43c39940b9f52d1e4d432bf74ab11ed2fd297e6e743a376aa"),
        .binaryTarget(name: "avutil", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avutil.zip", checksum: "fc121ea6f6db8bffa6f14527201ef12111bc0ee347d0a4739f0a973e862291d8"),
        .binaryTarget(name: "avformat", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avformat.zip", checksum: "d25c53a75fcb67818c3843df82b767318af147caae0060597362bb2b5b4b352b"),
        .binaryTarget(name: "avfilter", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avfilter.zip", checksum: "c6e99e7ab4555690d87403f07a6f92f1952251399ef5cc490657e3e17d802fd6"),
        .binaryTarget(name: "avdevice", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avdevice.zip", checksum: "bada0751e28cebc8d15dc153ff09b6b8b456da3cf419cf7b14f9804b93b1bbcb"),
        .binaryTarget(name: "swscale", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/swscale.zip", checksum: "232daeb254ebaaa3f16c9263a1b38230c16ccf1e746dbb21e054b594c84312eb"),
        .binaryTarget(name: "swresample", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/swresample.zip", checksum: "902469fe2314c37b407ea3d123efe49c004c7e2182b9ab7c8405bfc8ba44a14d"),
        .binaryTarget(name: "fftools", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/fftools.zip", checksum: "9a8d52c71e1c8f0dc21e65da307a459fa3006a3b79b4917f795906fb9138803a"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
