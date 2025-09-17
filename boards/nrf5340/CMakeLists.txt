set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/startup_nrf5340.S PROPERTIES LANGUAGE ASM)

add_executable(nrf_app
    ${CMAKE_SOURCE_DIR}/src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/nrf5340_code.c
    ${CMAKE_CURRENT_SOURCE_DIR}/startup_nrf5340.S
    ${CMAKE_SOURCE_DIR}/src/syscalls.c
)

add_custom_command(TARGET nrf_app POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary ${CMAKE_CURRENT_BINARY_DIR}/nrf_app ${CMAKE_CURRENT_BINARY_DIR}/nrf_app.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${CMAKE_CURRENT_BINARY_DIR}/nrf_app ${CMAKE_CURRENT_BINARY_DIR}/nrf_app.hex
    COMMENT "Generating .bin and .hex files"
)

target_include_directories(nrf_app PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}
)