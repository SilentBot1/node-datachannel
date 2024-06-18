set(CMAKE_SYSTEM_NAME Linux)
set(triple $ENV{TRIPLE})

# use clang and lld
set(CMAKE_C_COMPILER $ENV{GCC})
set(CMAKE_CXX_COMPILER $ENV{GCC})
if (CMAKE_C_COMPILER MATCHES clang)
    add_link_options("-fuse-ld=lld")
endif()

set(CMAKE_SYSROOT "$ENV{SYSROOT}")
message(STATUS "Using sysroot: ${CMAKE_SYSROOT}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER_TARGET ${triple})
message(STATUS "Compiling for: ${triple}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} $ENV{COMPILER_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} $ENV{COMPILER_FLAGS}")

if (CMAKE_C_FLAGS MATCHES -fPIC)
    add_link_options("-fPIC")
endif ()