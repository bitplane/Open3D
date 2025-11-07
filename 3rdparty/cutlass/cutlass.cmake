include(ExternalProject)

ExternalProject_Add(
    ext_cutlass
    PREFIX cutlass
    URL https://github.com/NVIDIA/cutlass/archive/refs/tags/v1.3.3.tar.gz
    URL_HASH SHA256=12d5b4c913063625154019b0a03a253c5b9339c969939454b81f6baaf82b34ca
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/cutlass"
    UPDATE_COMMAND ""
    PATCH_COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/" {} \; || true
    COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/" {} \; || true
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(ext_cutlass SOURCE_DIR)
set(CUTLASS_INCLUDE_DIRS ${SOURCE_DIR}/) # "/" is critical.
