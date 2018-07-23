
cmake_minimum_required(VERSION 2.8)

find_package(VTK REQUIRED)
include(${VTK_USE_FILE})

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(Saxon  REQUIRED)
find_package(Doxygen REQUIRED)

get_property(VTK_INCLUDES_LIST
  DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  PROPERTY INCLUDE_DIRECTORIES)

string(REPLACE ";" " " VTK_INCLUDES "${VTK_INCLUDES_LIST}")

set(XML_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/xml)
set(VTK_HEADER_INDEX_XML ${XML_OUTPUT_DIR}/index.xml)

set(SRC_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/src
  CACHE PATH "output source directory")

add_subdirectory(doxyfile)
add_subdirectory(xml     )
