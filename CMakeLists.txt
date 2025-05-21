cmake_minimum_required(VERSION 3.5)
project(RingMarkdown)

# Get the Ring source directory from environment or use default
if(NOT DEFINED ENV{RING})
    set(RING_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/../..")
    message(STATUS "RING_SOURCE not defined, using default: ${RING_SOURCE}")
else()
    set(RING_SOURCE $ENV{RING})
    message(STATUS "Using RING_SOURCE from environment: ${RING_SOURCE}")
endif()

# Set paths
set(RING_INCLUDE "${RING_SOURCE}/language/include")
set(RING_LIB "${RING_SOURCE}/lib")
set(CODEGEN_SCRIPT "${RING_SOURCE}/extensions/codegen/parsec.ring")

# MD4C Configuration
set(BUILD_SHARED_LIBS OFF CACHE BOOL "Build shared instead of static libs" FORCE)
set(BUILD_MD2HTML_EXECUTABLE OFF CACHE BOOL "Whether to compile the md2html executable" FORCE)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Add md4c as a subdirectory
add_subdirectory(src/md4c)

# Generate the C source code from the configuration file
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/ring_markdown.c
    COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_CURRENT_BINARY_DIR}
    COMMAND ${RING_SOURCE}/bin/ring ${CODEGEN_SCRIPT} ${CMAKE_CURRENT_SOURCE_DIR}/src/md4c.cf ${CMAKE_CURRENT_BINARY_DIR}/ring_markdown.c ${CMAKE_CURRENT_SOURCE_DIR}/src/ring_markdown.rh
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/src/md4c.cf ${CODEGEN_SCRIPT}
    COMMENT "Generating C code from md4c.cf"
    VERBATIM
)

# Determine OS and Architecture specific paths
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(OS_DIR "linux")
    set(LIB_EXT ".so")
elseif(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD")
    set(OS_DIR "freebsd")
    set(LIB_EXT ".so")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(OS_DIR "windows")
    set(LIB_EXT ".dll")
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(OS_DIR "macos")
    set(LIB_EXT ".dylib")
else()
    message(FATAL_ERROR "Unsupported operating system: ${CMAKE_SYSTEM_NAME}")
endif()

if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64|AMD64")
    set(ARCH_DIR "amd64")
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|ARM64")
    set(ARCH_DIR "arm64")
else()
    message(FATAL_ERROR "Unsupported architecture: ${CMAKE_SYSTEM_PROCESSOR}")
endif()

# Set the destination directory for the built library
set(LIB_DEST_DIR "${CMAKE_CURRENT_SOURCE_DIR}/lib/${OS_DIR}/${ARCH_DIR}")

# Create the Ring markdown extension shared library
add_library(ring_markdown SHARED 
    ${CMAKE_CURRENT_BINARY_DIR}/ring_markdown.c
)

# Include directories
target_include_directories(ring_markdown PRIVATE 
    ${RING_INCLUDE}
    ${CMAKE_CURRENT_SOURCE_DIR}/src/md4c/src
)

# Strip debug symbols in release builds
if(NOT CMAKE_BUILD_TYPE MATCHES Debug)
    if(UNIX)
        target_link_options(ring_markdown PRIVATE -s)
    elseif(WIN32)
        target_link_options(ring_markdown PRIVATE /STRIP)
    endif()
endif()

# Link libraries
if(WIN32)
    target_link_libraries(ring_markdown
        ${RING_LIB}/ring.lib
        md4c
        md4c-html
    )
else()
    target_link_libraries(ring_markdown
        ${RING_LIB}/libring${CMAKE_SHARED_LIBRARY_SUFFIX}
        md4c
        md4c-html
    )
endif()

# Set target properties for output name and prefix
if(WIN32)
    set_target_properties(ring_markdown PROPERTIES
        OUTPUT_NAME "ring_markdown"
    )
else()
    set_target_properties(ring_markdown PROPERTIES
        PREFIX "lib"
        OUTPUT_NAME "ring_markdown"
    )
endif()

# Add post-build command to copy the built library to the OS/architecture-specific directory
add_custom_command(
    TARGET ring_markdown
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${LIB_DEST_DIR}
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:ring_markdown> ${LIB_DEST_DIR}
    COMMENT "Copying built library to ${LIB_DEST_DIR}"
    VERBATIM
)

# Install rule
install(TARGETS ring_markdown
    LIBRARY DESTINATION ${RING_LIB}
)

# Print info message
message(STATUS "Ring Markdown Extension Configuration:")
message(STATUS "  - Ring Include Dir: ${RING_INCLUDE}")
message(STATUS "  - Ring Library Dir: ${RING_LIB}")