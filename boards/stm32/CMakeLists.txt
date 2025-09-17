add_executable(stm32_app
    ${CMAKE_SOURCE_DIR}/src/main.c
    ${CMAKE_CURRENT_SOURCE_DIR}/stm32_code.c
    ${CMAKE_CURRENT_SOURCE_DIR}/startup_stm32f4xx.s
)

target_include_directories(stm32_app PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_options(stm32_app PRIVATE
    "-T${CMAKE_CURRENT_SOURCE_DIR}/stm32f4.ld"
    "-nostartfiles"
    "-nostdlib"
)

add_custom_command(TARGET stm32_app POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary ${CMAKE_CURRENT_BINARY_DIR}/stm32_app ${CMAKE_CURRENT_BINARY_DIR}/stm32_app.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex ${CMAKE_CURRENT_BINARY_DIR}/stm32_app ${CMAKE_CURRENT_BINARY_DIR}/stm32_app.hex
    COMMENT "Generating .bin and .hex files for STM32"
)
