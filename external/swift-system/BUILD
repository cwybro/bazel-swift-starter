load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

cc_library(
      name = "CSystem",
      srcs = glob([
          "Sources/CSystem/**/*.c",
      ], allow_empty = False),
      hdrs = glob([
          "Sources/CSystem/include/*.h",
      ], allow_empty = False),
)

swift_library(
      name = "SystemPackage",
      module_name = "SystemPackage",
      srcs = glob([
          "Sources/System/**/*.swift",
      ], allow_empty = False),
      defines = [
          "SYSTEM_PACKAGE",
      ],
      deps = [
          ":CSystem",
      ],
      visibility = ["//visibility:public"],
)
