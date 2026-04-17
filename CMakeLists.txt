project(brst-binding-ecl)
cmake_minimum_required(VERSION 3.20)

set(LIBBERESTA_DIR "../libberesta")

add_custom_target(binding)
add_custom_target(bundle)
add_custom_target(check)

find_program(
    ECL_EXE
  NAMES
    ecl
)

if ("${ECL_EXE}" STREQUAL "ECL_EXE-NOTFOUND")
  message(FATAL_ERROR "`ecl` executable could not be found!")
endif()

set(BRST_LIB_DIR "")

if(EXISTS "${CMAKE_SOURCE_DIR}/${LIBBERESTA_DIR}/gen/data/gen.cmake")
  set(BRST_LIB_DIR "${CMAKE_SOURCE_DIR}/${LIBBERESTA_DIR}/")
else()
  if(EXISTS "${LIBBERESTA_DIR}/gen/data/gen.cmake")
    set(BRST_LIB_DIR "${LIBBERESTA_DIR}/")
  else()
    message(FATAL_ERROR "libBeresta dir is not found or correct (set -DLIBBERESTA_DIR param)")
  endif()
endif()

include(${BRST_LIB_DIR}/gen/data/gen.cmake)
add_custom_command(
  TARGET binding
#    COMMAND ${CMAKE_COMMAND} -E ${CMAKE_SOURCE_DIR}/templates/macro.lisp 
#    ${CMAKE_SOURCE_DIR}/src/macro.lisp
  COMMAND ecl
  ARGS --load ${BRST_LIB_DIR}/gen/scripts/utils.lisp
       --load ${CMAKE_SOURCE_DIR}/scripts/binding.lisp
       --load ${CMAKE_SOURCE_DIR}/scripts/launcher.lisp --
       ${BRST_LIB_DIR}/gen/data/
       ${CMAKE_SOURCE_DIR}/templates/
       ${CMAKE_SOURCE_DIR}/src/
)