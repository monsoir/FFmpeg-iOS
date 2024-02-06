// swift-tools-version:5.3

import PackageDescription

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
        .binaryTarget(name: "avcodec", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/avcodec.xcframework.zip", checksum: "699282fb8670223e799a2a05eefeff0c"),
        .binaryTarget(name: "avutil", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/avutil.xcframework.zip", checksum: "e4492bbcf66fd4f1b035708ce2b078fb"),
        .binaryTarget(name: "avformat", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/avformat.xcframework.zip", checksum: "d0efade9fe412eb07286b8dded41e20f"),
        .binaryTarget(name: "avfilter", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/avfilter.xcframework.zip", checksum: "e91f134548ade6b1fe5cdd950d8d1bb0"),
        .binaryTarget(name: "avdevice", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/avdevice.xcframework.zip", checksum: "9dfe32d78de3ebbe1ab999c7b6af8f38"),
        .binaryTarget(name: "swscale", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/swscale.xcframework.zip", checksum: "fbcc409853487fd3fcf77f2cc4185762"),
        .binaryTarget(name: "swresample", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/v1.0.0/swresample.xcframework.zip", checksum: "e6da240c21910423057fcb83a5dbd7b9"),
        .binaryTarget(name: "fftools", url: "https://github.com/kewlbear/FFmpeg-iOS/releases/download/v0.0.6-b20230416-173821/fftools.zip", checksum: "da3e909deb1ee98ef2425a2a4640b663fbb84ecc4204d663b1959c8de587acc7"),
        .target(name: "Dummy", dependencies: [
            "fftools",
            "avcodec", "avformat", "avfilter", "avdevice", "avutil", "swscale", "swresample",
            "FFmpeg-iOS-Support",
        ]),
        .testTarget(name: "FFmpeg-iOSTests",
                    dependencies: ["Dummy",]),
    ]
)
