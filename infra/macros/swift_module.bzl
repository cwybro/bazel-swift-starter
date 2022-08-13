load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_test")
load("@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:xcodeproj.bzl", "xcodeproj")

def swift_module(
    name,
    srcs,
    data = [],
    deps = [],
    test_srcs = [],
    test_data = [],
    test_deps = [],
    test_minimum_os_version = "12.5",
    visibility = None,
    mockgen_enabled = True,
    project_enabled = True,
):
  # =================
  # SOURCE MODULE
  # =================
  project_targets = []
  SOURCE_FILES_NAME = "%s_SourceFiles" % name
  native.filegroup(
      name = SOURCE_FILES_NAME,
      srcs = srcs
  )
  source_library_data = []
  if data:
      SOURCE_DATA_NAME = "%s_SourceData" % name
      native.filegroup(
          name = SOURCE_DATA_NAME,
          srcs = data
      )
      source_library_data.append(":%s" % SOURCE_DATA_NAME)
  swift_library(
      name = name,
      module_name = name,
      srcs = [":%s" % SOURCE_FILES_NAME],
      data = source_library_data,
      deps = deps,
      visibility = visibility,
  )
  project_targets.append(":%s" % name)

  # =================
  # GENERATED MOCKS
  # =================
  if mockgen_enabled:
      native.genrule(
          name = "%s_GeneratedMocks" % name,
          srcs = [":%s" % SOURCE_FILES_NAME],
          outs = ["%sGeneratedMocks.swift" % name],
          tools = ["@com_github_uber_mockolo//:mockolo"],
          cmd = "$(location @com_github_uber_mockolo//:mockolo) --sourcefiles $(SRCS) --destination $@ --testable-imports %s --enable-args-history > /dev/null" % name,
      )
      swift_library(
          name = "%sGeneratedMocks" % name,
          module_name = "%sGeneratedMocks" % name,
          srcs = [":%s_GeneratedMocks" % name],
          deps = [":%s" % name],
          visibility = visibility,
      )

  # =================
  # TEST MODULE
  # =================
  if test_srcs:
      TEST_FILES_NAME = "%s_TestFiles" % name
      native.filegroup(
          name = TEST_FILES_NAME,
          srcs = test_srcs
      )
      test_library_deps = [":%s" % name] + test_deps
      if mockgen_enabled:
          test_library_deps.append(":%sGeneratedMocks" % name)
      swift_test(
          name = "%s_UnitTests" % name,
          srcs = [":%s" % TEST_FILES_NAME],
          data = test_data,
          deps = test_library_deps,
          visibility = visibility,
      )
      project_targets.append(":%s_UnitTests" % name)

  # =================
  # XCODE PROJECT
  # =================
  if project_enabled:
      xcodeproj(
          name = "%s_Project" % name,
          project_name = "%sProject" % name,
          tags = ["manual"],
          top_level_targets = project_targets,
      )
