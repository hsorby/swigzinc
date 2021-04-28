

# SWIGZinc
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

cmake_minimum_required(VERSION 3.10.0)
cmake_policy(VERSION 3.10.0)

if(POLICY CMP0078)
    cmake_policy(SET CMP0078 NEW)
endif()

if(POLICY CMP0086)
    cmake_policy(SET CMP0086 NEW)
endif()

# This is the project name and shows up in IDEs
project(SWIGZinc VERSION 3.2.0 LANGUAGES C CXX)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(Zinc CONFIG REQUIRED)

include(environmentchecks)

set(_PARAM_ANNOTATION "Enable Python bindings.")
if(PYTHON_BINDINGS_AVAILABLE)
  set(SWIGZINC_PYTHON_BINDINGS ON CACHE BOOL "${_PARAM_ANNOTATION}")
endif()
if(DEFINED PYTHON_BINDINGS AND PYTHON_BINDINGS_AVAILABLE)
  set(SWIGZINC_PYTHON_BINDINGS "${PYTHON_BINDINGS}" CACHE BOOL "${_PARAM_ANNOTATION}" FORCE)
elseif(CLANG_TIDY)
  message(WARNING "Python bindings has been requested but not available!")
endif()
unset(PYTHON_BINDINGS CACHE)


add_subdirectory(src)

message(STATUS "Summary")
message(STATUS "- Using Zinc: ${Zinc_DIR}")
message(STATUS "- Zinc version: ${Zinc_VERSION}")
message(STATUS "- Python version: ${Python_VERSION}")
message(STATUS "- SWIG version: ${SWIG_VERSION}")

