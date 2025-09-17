
.syntax unified
.cpu cortex-m4
.thumb

.global _start
.global Reset_Handler

.section .isr_vector, "a", %progbits
.type g_pfnVectors, %object

// Vector table
.g_pfnVectors:
    .word _estack                // Initial stack pointer
    .word Reset_Handler         // Reset handler
    .word 0                     // NMI handler (not used)
    .word 0                     // Hard fault handler (not used)
    .word 0                     // Memory management fault
    .word 0                     // Bus fault
    .word 0                     // Usage fault
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word 0                     // Reserved
    .word 0                     // SVCall
    .word 0                     // Debug monitor
    .word 0                     // Reserved
    .word 0                     // PendSV
    .word 0                     // SysTick

.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    // Call main
    bl main

    // Infinite loop after main returns
loop:
    b loop

.size Reset_Handler, .-Reset_Handler

.section .stack
_estack:
    .space 0x400
