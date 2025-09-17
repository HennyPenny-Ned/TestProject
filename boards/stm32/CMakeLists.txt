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
