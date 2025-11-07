include(ExternalProject)

ExternalProject_Add(
    ext_nanoflann
    PREFIX nanoflann
    URL https://github.com/jlblancoc/nanoflann/archive/refs/tags/v1.5.0.tar.gz
    URL_HASH SHA256=89aecfef1a956ccba7e40f24561846d064f309bc547cc184af7f4426e42f8e65
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/nanoflann"
    UPDATE_COMMAND ""
    PATCH_COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/" {} \; || true
    COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/" {} \; || true
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_Property(ext_nanoflann SOURCE_DIR)
set(NANOFLANN_INCLUDE_DIRS ${SOURCE_DIR}/include/) # "/" is critical.
