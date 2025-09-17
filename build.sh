#!/bin/bash

echo "Which MCU would you like to build for?"
echo "1) STM32"
echo "2) nRF5340"
read -p "Enter your choice (1 or 2): " choice

# Clean previous build
rm -rf build

# Set toolchain and MCU based on user input
if [ "$choice" == "1" ]; then
  TOOLCHAIN="cmake/toolchain_stm32.cmake"
  MCU="stm32"
elif [ "$choice" == "2" ]; then
  TOOLCHAIN="cmake/toolchain_nrf5340.cmake"
  MCU="nrf5340"
else
  echo "Invalid choice. Exiting."
  exit 1
fi

# Configure with CMake using the selected toolchain
cmake -G Ninja -B build \
  -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN \
  -DMCU=$MCU

# Build the project
cmake --build build
