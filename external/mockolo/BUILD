load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_binary")

swift_library(
      name = "MockoloFramework",
      module_name = "MockoloFramework",
      srcs = glob([
          "Sources/MockoloFramework/**/*.swift"
      ], allow_empty = False),
      deps = [
          "@com_github_keith_swift_syntax//:SwiftSyntaxParser",
      ],
      visibility = ["//visibility:private"],
)

swift_binary(
      name = "mockolo",
      srcs = glob([
          "Sources/Mockolo/**/*.swift"
      ], allow_empty = False),
      deps = [
          ":MockoloFramework",
          "@com_github_apple_swift_argument_parser//:ArgumentParser",
          "@com_github_apple_swift_tools_support_core//:TSCBasic",
          "@com_github_apple_swift_tools_support_core//:TSCUtility",
      ],
      visibility = ["//visibility:public"],
)
