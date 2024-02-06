// swift-tools-version:5.3

import PackageDescription

let version = "v1.0.1"

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
        .binaryTarget(name: "avcodec", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avcodec.xcframework.zip", checksum: "fd36820089a60a852392ed945a64fb52975e652249511b50b1203cd52adf8a98"),
        .binaryTarget(name: "avutil", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avutil.xcframework.zip", checksum: "5360e5ac16beebb8b8b0299233947eda9aa630d90a885531d80616f5b1cb892a"),
        .binaryTarget(name: "avformat", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avformat.xcframework.zip", checksum: "ee157fac4c1aaf72c8e8218ec5f9771fc926fe33ac02171eb49cd648e7d4ad38"),
        .binaryTarget(name: "avfilter", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avfilter.xcframework.zip", checksum: "f57c57cb6f70411443a8ecda171f9de14e415e92293facc3f402cd1de212e520"),
        .binaryTarget(name: "avdevice", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/avdevice.xcframework.zip", checksum: "5ec8ac964f4d99b081111e17bbff129534f87d135a1bc7861c8773a744e16823"),
        .binaryTarget(name: "swscale", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/swscale.xcframework.zip", checksum: "527542f997f0915d8912eb0acb8f59f87b4086c06f2427847f5b6ce7bb32b301"),
        .binaryTarget(name: "swresample", url: "https://github.com/monsoir/FFmpeg-iOS/releases/download/\(version)/swresample.xcframework.zip", checksum: "baf0a70780785a6edb6c9e179f11bb28ec934027625a14dbd1f37c896c878ac1"),
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
