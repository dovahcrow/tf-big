licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = 'python/ops/_big_ops.so',
    srcs = [
        "cc/big_tensor.h",
        "cc/big_tensor.cc",
        "cc/ops/big_ops.cc",
        "cc/kernels/big_kernels.cc",
    ],
    linkshared = 1,
    deps = [
        "@local_config_tf//:libtensorflow_framework",
        "@local_config_tf//:tf_header_lib",
        "@libgmp//:lib"
    ],
    copts = ["-pthread", "-std=c++11", "-D_GLIBCXX_USE_CXX11_ABI=1", "-fPIC"],
)

py_library(
    name = "big_ops_py",
    srcs = ([
        "python/tensor.py",
        "python/ops/big_ops.py",
    ]),
    data = [
        ":python/ops/_big_ops.so"
    ],
    srcs_version = "PY2AND3",
)

py_test(
    name = "big_ops_py_test",
    srcs = [
        "python/ops/big_ops_test.py",
    ],
    main = "python/ops/big_ops_test.py",
    deps = [
        ":big_ops_py",
        "//tf_big/python/test:test_py",
    ],
    srcs_version = "PY2AND3",
)

py_test(
    name = "tensor_test",
    srcs = [
        "python/tensor_test.py",
    ],
    main = "python/tensor_test.py",
    deps = [
        ":big_ops_py",
        "//tf_big/python/test:test_py",
    ],
    srcs_version = "PY2AND3",
)

py_library(
    name = "tf_big_py",
    srcs = ([
        "__init__.py",
        "python/__init__.py",
        "python/ops/__init__.py",
    ]),
    deps = [
        ":big_ops_py",
        "//tf_big/python/test:test_py",
    ],
    srcs_version = "PY2AND3",
)
