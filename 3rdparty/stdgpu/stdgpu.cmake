# Exports: ${STDGPU_INCLUDE_DIRS}
# Exports: ${STDGPU_LIB_DIR}
# Exports: ${STDGPU_LIBRARIES}

include(ExternalProject)

ExternalProject_Add(
    ext_stdgpu
    PREFIX stdgpu
    URL https://github.com/stotko/stdgpu/archive/e10f6f3ccc9902d693af4380c3bcd188ec34a2e6.tar.gz
    URL_HASH SHA256=7bb2733b099f7cedc86d2aee7830d128ac1222cfafa34cbaa4e818483c0a93f6
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/stdgpu"
    UPDATE_COMMAND ""
    PATCH_COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_minimum_required.*/cmake_minimum_required(VERSION 3.5)/" {} \; || true
    COMMAND find . -name "CMakeLists.txt" -exec sed -i "s/cmake_policy(VERSION [0-2]\.[0-9.]*)/cmake_policy(VERSION 3.5)/" {} \; || true
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
        -DCUDAToolkit_ROOT=${CUDAToolkit_LIBRARY_ROOT}
        -DSTDGPU_BUILD_SHARED_LIBS=OFF
        -DSTDGPU_BUILD_EXAMPLES=OFF
        -DSTDGPU_BUILD_TESTS=OFF
        -DSTDGPU_ENABLE_CONTRACT_CHECKS=OFF
        -DTHRUST_INCLUDE_DIR=${CUDAToolkit_INCLUDE_DIRS}
        ${ExternalProject_CMAKE_ARGS_hidden}
    CMAKE_CACHE_ARGS    # Lists must be passed via CMAKE_CACHE_ARGS
        -DCMAKE_CUDA_ARCHITECTURES:STRING=${CMAKE_CUDA_ARCHITECTURES}
    BUILD_BYPRODUCTS
        <INSTALL_DIR>/lib/${CMAKE_STATIC_LIBRARY_PREFIX}stdgpu${CMAKE_STATIC_LIBRARY_SUFFIX}
)

ExternalProject_Get_Property(ext_stdgpu INSTALL_DIR)
set(STDGPU_INCLUDE_DIRS ${INSTALL_DIR}/include/) # "/" is critical.
set(STDGPU_LIB_DIR ${INSTALL_DIR}/lib)
set(STDGPU_LIBRARIES stdgpu)
