load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "a647ad9ee6664a78377cf5707331966b6788be09d1fea48045a61bc450c8f1b1",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/0.7.0/release.tar.gz",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "com_github_uber_mockolo",
    url = "https://github.com/uber/mockolo/archive/refs/tags/1.7.0.tar.gz",
    sha256 = "b36c49d835895b643e631c5cba3c9048f0628f68d37c5adf739a30de93677304",
    build_file = "mockolo/BUILD",
    strip_prefix = "mockolo-1.7.0"
)

http_archive(
    name = "com_github_keith_swift_syntax_bazel",
    sha256 = "f83b8449f84e29d263d2b0ceb9d2ae7f88c9f2a81f4b10035e94073664507507",
    strip_prefix = "swift-syntax-bazel-13.3.13E113",
    url = "https://github.com/keith/swift-syntax-bazel/archive/refs/tags/13.3.13E113.tar.gz",
)

load("@com_github_keith_swift_syntax_bazel//:deps.bzl", "swift_syntax_deps")

swift_syntax_deps()

http_archive(
    name = "com_github_apple_swift_argument_parser",
    url = "https://github.com/apple/swift-argument-parser/archive/refs/tags/1.0.3.tar.gz",
    sha256 = "a4d4c08cf280615fe6e00752ef60e28e76f07c25eb4706a9269bf38135cd9c3f",
    build_file = "swift-argument-parser/BUILD",
    strip_prefix = "swift-argument-parser-1.0.3"
)

http_archive(
    name = "com_github_apple_swift_tools_support_core",
    url = "https://github.com/apple/swift-tools-support-core/archive/refs/tags/0.2.3.tar.gz",
    sha256 = "440594f4f1db96ef38a12144f98ea819635699f4c46ed9bee1685f1c431f40f8",
    build_file = "swift-tools-support-core/BUILD",
    strip_prefix = "swift-tools-support-core-0.2.3"
)

http_archive(
    name = "com_github_apple_swift_system",
    url = "https://github.com/apple/swift-system/archive/refs/tags/1.1.1.tar.gz",
    sha256 = "865b8c380455eef27e73109835142920c60ae4c4f4178a3d12ad04acc83f1371",
    build_file = "swift-system/BUILD",
    strip_prefix = "swift-system-1.1.1"
)
