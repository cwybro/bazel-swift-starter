# bazel-swift-starter

This repository template is for new Swift projects that want to use [Bazel](https://bazel.build) from the start. It provides the following conveniences to help bootstrap projects:
- [Mockolo](external/mockolo/BUILD) external dependency, built from source
- [`swift_module` macro](infra/macros/swift_module.bzl) for creating `swift_library` targets, along with associated mockgen and test targets

## Usage

1. Select the `Use this template` option and create your new repository based on this template.
2. Update [`WORKSPACE`](WORKSPACE) for your needs
3. Update [`.bazelversion`](.bazelversion) with the version of Bazel you wish to use (if you're using [bazelisk](https://github.com/bazelbuild/bazelisk))
4. Update [`swift_module`](infra/macros/swift_module.bzl) definition for your needs

## Setup

As a convenience, a [`Makefile`](Makefile) has been provided. It contains a single command that can be invoked to install [bazelisk](https://github.com/bazelbuild/bazelisk) if needed:
```bash
make setup
```

## Getting Started

### New Targets
To create new `swift_module` targets, add a `BUILD` file similar to the following (substituting your own values):
```starlark
load("//infra/macros:swift_module.bzl", "swift_module")

swift_module(
    name = "ExampleLibrary",
    srcs = glob([
        "source/**/*.swift",
    ], allow_empty = False),
    test_srcs = glob([
        "test/**/*.swift",
    ], allow_empty = False),
    visibility = ["//visibility:public"],
)
```

### Open Xcode Project
`xcodeproj` targets are created for all `swift_module` by default. These projects can be generated via:
```bash
bazelisk run //:ExampleLibrary_Project
```

**Note:** Automatic project creation can be disabled by adding `project_enabled = False` to the `swift_module` definition.
