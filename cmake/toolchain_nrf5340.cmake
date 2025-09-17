# Target system and processor
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m33)

# Compiler settings
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Compiler flags
set(CMAKE_C_FLAGS_INIT "-mcpu=cortex-m33 -mthumb -mfloat-abi=soft -Wall -Wextra")
set(CMAKE_CXX_FLAGS_INIT "-mcpu=cortex-m33 -mthumb -mfloat-abi=soft -Wall -Wextra")
set(CMAKE_ASM_FLAGS_INIT "-mcpu=cortex-m33 -mthumb")

# Linker script path
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/boards/nrf5340/nrf5340.ld")

# Linker flags (use INIT to avoid duplication)
set(CMAKE_EXE_LINKER_FLAGS_INIT "-T${LINKER_SCRIPT}")
