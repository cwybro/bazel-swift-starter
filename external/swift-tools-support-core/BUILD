load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_c_module")

swift_library(
      name = "TSCLibc",
      module_name = "TSCLibc",
      srcs = glob([
          "Sources/TSCLibc/**/*.swift",
      ], allow_empty = False),
      visibility = ["//visibility:private"],
)

cc_library(
      name = "TSCclibc",
      srcs = glob([
          "Sources/TSCclibc/**/*.c",
      ], allow_empty = False),
      hdrs = glob([
          "Sources/TSCclibc/include/*.h",
      ], allow_empty = False),
      tags = ["swift_module=TSCclibc"],
      visibility = ["//visibility:private"],
)

swift_c_module(
      name = "TSCclibc_SwiftCModule",
      module_name = "TSCclibc",
      deps = [
          ":TSCclibc",
      ],
      module_map = "Sources/TSCclibc/include/module.modulemap",
)

swift_library(
      name = "TSCBasic",
      module_name = "TSCBasic",
      srcs = glob([
          "Sources/TSCBasic/**/*.swift",
      ], allow_empty = False),
      deps = [
          ":TSCLibc",
          ":TSCclibc_SwiftCModule",
          "@com_github_apple_swift_system//:SystemPackage",
      ],
      visibility = ["//visibility:public"],
)

swift_library(
      name = "TSCUtility",
      module_name = "TSCUtility",
      srcs = glob([
          "Sources/TSCUtility/**/*.swift",
      ], allow_empty = False),
      deps = [
          ":TSCBasic",
          ":TSCclibc_SwiftCModule",
      ],
      visibility = ["//visibility:public"],
)
