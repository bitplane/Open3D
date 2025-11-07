include(ExternalProject)

ExternalProject_Add(
    ext_cub
    PREFIX cub
    URL https://github.com/NVIDIA/cub/archive/refs/tags/1.8.0.tar.gz
    URL_HASH SHA256=025658f4c933cd2aa8cc88a559d013338d68de3fa639cc1f2b12cf61dc759667
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/cub"
    UPDATE_COMMAND ""
    PATCH_COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/" {} \; || true
    COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/" {} \; || true
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(ext_cub SOURCE_DIR)
set(CUB_INCLUDE_DIRS ${SOURCE_DIR}/) # "/" is critical.
