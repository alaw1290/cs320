#
# Using CMake for compilation
#
cmake_minimum_required (VERSION 2.6)
project (assign07_sol)
#
set(PATSCC $ENV{PATSHOME}/bin/patscc)
set(PATSopt $ENV{PATSHOME}/bin/patsopt)
#
macro(
  patscc_dats fname
)
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${fname}_dats.c
  COMMAND ${PATSCC} -ccats ${CMAKE_SOURCE_DIR}/${fname}.dats
  MAIN_DEPENDENCY ${fname}.dats
)
endmacro(patscc_dats)
#
patscc_dats(assign07_sol)
#
add_executable(
  assign07_sol assign07_sol_dats.c
)
#
add_definitions(-DATS_MEMALLOC_LIBC)
#
include_directories("$ENV{PATSHOME}" "$ENV{PATSHOME}/ccomp/runtime")
#
include(CTest)
add_test(assign07_sol_test assign07_sol)
#
###### end of [CMakeLists.txt] ######
