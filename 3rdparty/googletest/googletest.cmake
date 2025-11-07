include(ExternalProject)

ExternalProject_Add(
    ext_googletest
    PREFIX googletest
    URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.tar.gz
    URL_HASH SHA256=b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/googletest"
    UPDATE_COMMAND ""
    PATCH_COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/" {} \; || true
    COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/" {} \; || true
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(ext_googletest SOURCE_DIR)
set(GOOGLETEST_SOURCE_DIR ${SOURCE_DIR})
