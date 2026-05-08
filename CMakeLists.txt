# brst-binding-ecl — mandatory baseline build entry point
#
# This CMakeLists.txt fulfils the libBeresta org-wide baseline for
# `brst-binding-<lang>` repositories (README.md + CMakeLists.txt). It exists to
# build the libBeresta library so that the ECL bindings can load and use.
#
# ECL binding uses static library `libbrst.a` and link it statically.
#
# Three modes are supported:
#
# 1. Vendored source mode:
#      Drop libBeresta source into ext/libBeresta/ (e.g. via git submodule or
#      tarball) and build from this directory:
#          cmake -S . -B build
#          cmake --build build
#
# 2. Relative source mode (multiple bindings development):
#      libBeresta sources expected to be relative to
#      binding repositories path like
#
#      libberesta/
#      brst-binding-ecl/
#      brst-binding-ruby/
#      ... and so on ...
#
#      Build system will check if sources are available by ../libberesta
#      path and if yes use it from that location.
#
#      Build commands are the same:
#          cmake -S . -B build
#          cmake --build build
#
# 3. External source mode (development convenience):
#      Pass -DLIBBRST_SOURCE_DIR=/path/to/libBeresta clone:
#          cmake -S . -B build -DLIBBRST_SOURCE_DIR=$HOME/src/libBeresta
#          cmake --build build
#

project(brst-binding-ecl)
cmake_minimum_required(VERSION 3.20)

find_program(
    ECL_EXE
  NAMES
    ecl
)

set(ECL_BINARY)

if (NOT EXISTS ${ECL_BINARY})
  if ("${ECL_EXE}" STREQUAL "ECL_EXE-NOTFOUND")
    message(FATAL_ERROR "`ecl` executable could not be found!")
  else()
    set(ECL_BINARY ${ECL_EXE})
  endif()

endif()


set(LIBRST_REL_DIR "../libberesta")

set(LIBBRST_SOURCE_DIR)

set(BRST_PROBE_FILE "gen/data/gen.cmake")

# Check direct path
message(DEBUG "Probing ${LIBBRST_SOURCE_DIR}/${BRST_PROBE_FILE} ...")

if(EXISTS "${LIBBRST_SOURCE_DIR}/${BRST_PROBE_FILE}")
  message(NOTICE "libBeresta source found at ${LIBBRST_SOURCE_DIR}.")
else()
  # Check ../libberesta folder for sources
  message(DEBUG "Probing ${CMAKE_CURRENT_LIST_DIR}/${LIBRST_REL_DIR}/${BRST_PROBE_FILE} ...")

  if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/${LIBRST_REL_DIR}/${BRST_PROBE_FILE}")
    set(LIBBRST_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/${LIBRST_REL_DIR}")
    message(NOTICE "libBeresta source found at ${LIBBRST_SOURCE_DIR}.")
  else()

    # Check ext/libberesta folder for sources
    message(DEBUG "Probing ${CMAKE_CURRENT_LIST_DIR}/ext/libberesta/${BRST_PROBE_FILE} ...")

    if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/ext/libberesta/${BRST_PROBE_FILE}")
      set(LIBBRST_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}/ext/libberesta/")
      message(NOTICE "libBeresta source found at ${LIBBRST_SOURCE_DIR}.")
    else()
      message(WARNING
        "libBeresta source not found at '${LIBBRST_SOURCE_DIR}'.\n"
        "Either:\n"
        "  - Pass -DLIBBRST_SOURCE_DIR=/path/to/libBeresta, or\n"
        "  - Place this repository source relative to ../libberesta/, or\n"
        "  - Place libBeresta source in ext/libberesta/ (e.g. git submodule)\n"
        "Skipping libBeresta build target.")
      return()
    endif()
  endif()
endif()

include(${LIBBRST_SOURCE_DIR}/gen/data/gen.cmake)

set(LIBBRST_SHARED_LIB OFF CACHE BOOL "" FORCE)
set(LIBBRST_EXAMPLES   OFF CACHE BOOL "" FORCE)
set(LIBBRST_TESTS      OFF CACHE BOOL "" FORCE)

add_subdirectory("${LIBBRST_SOURCE_DIR}" "${CMAKE_CURRENT_BINARY_DIR}/libberesta-build")

add_custom_target(binding)
add_custom_target(check DEPENDS brst)
add_custom_target(bundle)

add_custom_command(
  TARGET binding
  COMMAND ${ECL_BINARY}
  ARGS --load ${LIBBRST_SOURCE_DIR}/gen/scripts/utils.lisp
       --load ${CMAKE_SOURCE_DIR}/scripts/binding.lisp
       --load ${CMAKE_SOURCE_DIR}/scripts/launcher.lisp --
       ${LIBBRST_SOURCE_DIR}/gen/data/
       ${CMAKE_SOURCE_DIR}/templates/
       ${CMAKE_SOURCE_DIR}/src/
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
          ${CMAKE_SOURCE_DIR}/templates/macro.lisp
          "${CMAKE_SOURCE_DIR}/src/macro.lisp"
)

add_custom_command(
  TARGET check
  COMMAND ${ECL_BINARY}
  ARGS
  --eval "(setf compiler::*delete-files* nil)"
  --eval "(ext:install-c-compiler)"
  --eval "(setf c:*user-cc-flags* \"-I${LIBBRST_SOURCE_DIR}/include -I${CMAKE_CURRENT_BINARY_DIR}/libberesta-build/include -fPIC\")"
  --eval "(setf c:*user-linker-libs* \" -L$<TARGET_FILE_DIR:brst> -lbrst -fPIC -lz\")"
  --eval "(pushnew \"${CMAKE_SOURCE_DIR}/\" asdf:*central-registry*)"
  --eval "(asdf:load-system 'cl-beresta)"
  --eval "(asdf:load-system 'cl-beresta/tests)"
  --eval "(cl-beresta-tests:beresta-smoke-tests)"
  --eval "(si:exit 0)"
  VERBATIM
)

file(READ "version" VER)

install(FILES
     "LICENSE"
     "README.md"
     "cl-beresta.asd"
     "version"
     DESTINATION .
)

install(DIRECTORY "src"   DESTINATION .)
install(DIRECTORY "tests" DESTINATION .)

# Tell CPack to create a zip file.
set(CPACK_GENERATOR "TGZ")

# Tell CPack what to name the zip file. It will append `.tar.gz`.
set(CPACK_PACKAGE_FILE_NAME "${CMAKE_PROJECT_NAME}-${VER}")

# Tell CPack not to put everything inside an enclosing directory.
set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY OFF)

# Apparently this should be always on but isn't for backwards compatibility.
set(CPACK_VERBATIM_VARIABLES YES)

include(CPack)

add_custom_command(
  TARGET bundle
  COMMAND "${CMAKE_COMMAND}" --build . --target package
  WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
  COMMENT "Bundling package"
  VERBATIM
)
