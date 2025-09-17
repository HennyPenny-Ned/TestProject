# TestProject
Sample project to demonstrate support for both **STM32** and **nRF5340** microcontrollers.
This is built using **CMake**, **Arm GNU Toolchain**, and **Ninja**.

---
## 🛠️ Features
- Modular build system with MCU selection
- Custom startup files and linker scripts
- Minimal `main.c` for testing
- Supports both Cortex-M4 (STM32) and Cortex-M33 (nRF5340)

---
## 📁 Project Structure
TestProject/
├── boards/
│ ├── nrf5340/
│ │ ├── CMakeLists.txt
│ │ ├── nrf5340_code.c
│ │ ├── nrf5340.ld
│ │ └── startup_nrf5340.S
│ ├── stm32/
│ │ ├── CMakeLists.txt
│ │ ├── startup_stm32f4xx.S
│ │ ├── stm32_code.c
│ │ └── stm32f4.ld
├── cmake/
│ ├── toolchain_nrf5340.cmake
│ └── toolchain_stm32.cmake
├── include/
├── src/
│ ├── main.c
│ └── syscalls.c
├── build.sh
├── CMakeLists.txt
└──  README.md

---
## ⚙️ Build Instructions

### Prerequisites
- CMake
- Ninja
- Arm GNU Toolchain

### Build Steps
1. Open terminal in project root.
2. Run the build script:

```bash
./build.sh
```

3. Select your target MCU:
```bash
Which MCU would you like to build for?
1) STM32
2) nRF5340
Enter your choice (1 or 2):
```

4. The build system will:
    - Load the appropriate toolchain file
    - Use the correct linker script and startup file
    - Generate output in the build/ directory

### 🔧 Toolchain Files
Located in cmake folder
- toolchain_stm32.cmake: Configures build for STM32F4xx
- toolchain_nrf5340.cmake: Configures build for nRF5340

### 📦 Output
After a successful build, the output binary (.elf, .bin, or .hex) will be located in:
```bash
build/boards/<target>/
```

### 🙌 Author
Jhay MK. Nedic
Consultant & Embedded Systems Developer