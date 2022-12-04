workspace(name = "review")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "aff13f49b37678b4fae1a80710b21478a89d27615a22990a94a99244e4702061",
    strip_prefix = "rules_nixpkgs-74c40cf36e9a79bafc59e745c3d1e49ec3098b23",
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/74c40cf36e9a79bafc59e745c3d1e49ec3098b23.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_cc_configure",
    "nixpkgs_git_repository",
)

nixpkgs_git_repository(
    name = "nixpkgs",
    revision = "22.05",
    sha256 = "0f8c25433a6611fa5664797cd049c80faefec91575718794c701f3b033f2db01",
)

nixpkgs_cc_configure(
    name = "nixpkgs_config_cc",
    repository = "@nixpkgs",
)


load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_package")


nixpkgs_package(
    name = "boost",
    attribute_path = "boost175",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "boost.dev",
    attribute_path = "boost175.dev",
    build_file_content = """\
load("@rules_cc//cc:defs.bzl", "cc_library")
filegroup(
    name = "include",
    srcs = glob(["include/**/*.h", "include/**/*.hpp"]),
    visibility = ["//visibility:public"],
)
cc_library(
    name = "boost",
    srcs = ["@boost//:lib"],
    hdrs = [":include"],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
""",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "zlib",
    repository = "@nixpkgs",
)

nixpkgs_package(
    name = "zlib.dev",
    build_file_content = """\
load("@rules_cc//cc:defs.bzl", "cc_library")
filegroup(
    name = "include",
    srcs = glob(["include/**/*.h"]),
    visibility = ["//visibility:public"],
)
cc_library(
    name = "zlib",
    srcs = ["@zlib//:lib"],
    hdrs = [":include"],
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)
""",
    repository = "@nixpkgs",
)


# nixpkgs_package(
#     name = "opencv",
#     repository = "@nixpkgs",
# )

opencv_nix_file="""
{ pkgs ? import <nixpkgs> {} }:
let
  opencvGtk = pkgs.opencv.override (old : { enableGtk2 = true; });
in 
  opencvGtk
"""

nixpkgs_package(
    name = "opencvGtk",
    nix_file_content = opencv_nix_file,
    build_file_content = """\
load("@rules_cc//cc:defs.bzl", "cc_library")
filegroup(
    name = "include",
    srcs = glob([
        "include/**/*.h",
        "include/**/*.hpp",
    ]),
    visibility = ["//visibility:public"],
)

filegroup(
    name = "libs",
    srcs = glob(["lib/**/*"]),
    visibility = ["//visibility:public"],
)
cc_library(
    name = "opencv",
    srcs = [":libs"],
    hdrs = [":include"],
    strip_include_prefix = "include/opencv4",
    visibility = ["//visibility:public"],
)
""",
    repository = "@nixpkgs",
)
