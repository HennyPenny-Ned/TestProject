set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/startup_nrf5340.S PROPERTIES LANGUAGE ASM)

add_executable(nrf_app
    ${CMAKE_SOURCE_DIR}/src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/nrf5340_code.c
    ${CMAKE_CURRENT_SOURCE_DIR}/startup_nrf5340.S
    ${CMAKE_SOURCE_DIR}/src/syscalls.c
)

target_include_directories(nrf_app PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}
)