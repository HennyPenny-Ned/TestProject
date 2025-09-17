cmake_minimum_required(VERSION 3.15)

# Enable support for C, C++, and assembly (ASM)
project(TestProject C CXX ASM)
project(MCUProject C)

# User input: MCU type
set(MCU "" CACHE STRING "Target MCU (stm32 or nrf5340)")

# Select toolchain based on MCU
if(MCU STREQUAL "stm32")
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/cmake/toolchain_stm32.cmake")
    add_subdirectory(boards/stm32)
else()
    if(MCU STREQUAL "nrf5340")
        set(CMAKE_TOOLCHAIN_FILE "${CMAKE_SOURCE_DIR}/cmake/toolchain_nrf5340.cmake")
        add_subdirectory(boards/nrf5340)
    else()
        message(FATAL_ERROR "Please specify MCU=stm32 or MCU=nrf5340")
    endif()
endif()
