# Set installation destination paths.
if (SKBUILD)
    set(PYTHON_DESTINATION_PREFIX cmlibs.zinc)
else()
    set(PYTHON_DESTINATION_PREFIX lib/python${Python_VERSION_MAJOR}.${Python_VERSION_MINOR}${CFG_DIR}/cmlibs.zinc)
endif()
set(PYTHON_MODULE_TARGETS_DESTINATION_PREFIX "${PYTHON_DESTINATION_PREFIX}/cmlibs/zinc")

install(TARGETS ${SWIG_MODULE_TARGETS} ${ZINC_SHARED_TARGET}
    DESTINATION ${PYTHON_MODULE_TARGETS_DESTINATION_PREFIX}
    COMPONENT PythonBindings
)
install(FILES $<TARGET_FILE:zinc> ${_GENERATOR_EXPRESSION_ZINC_SONAME}
    DESTINATION ${PYTHON_MODULE_TARGETS_DESTINATION_PREFIX}
    COMPONENT PythonBindings
)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}${CFG_INSTALL_DIR}/setup.py
    DESTINATION ${PYTHON_DESTINATION_PREFIX}
    COMPONENT PythonBindings
)
install(DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}${CFG_INSTALL_DIR}/cmlibs
    DESTINATION ${PYTHON_DESTINATION_PREFIX}
    COMPONENT PythonBindings
    FILES_MATCHING PATTERN "*.py"
)
install(FILES "${BASE_PYTHON_PACKAGE_DIR}/README.rst"
    DESTINATION ${PYTHON_DESTINATION_PREFIX}
    COMPONENT PythonBindings
)

add_custom_target(install-python-bindings
    ${CMAKE_COMMAND}
    -DCMAKE_INSTALL_COMPONENT=PythonBindings
    -P "${PROJECT_BINARY_DIR}/cmake_install.cmake"
    DEPENDS ${SWIG_MODULE_TARGETS} ${ZINC_SHARED_TARGET}
)
