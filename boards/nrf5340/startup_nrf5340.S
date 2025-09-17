.syntax unified
.cpu cortex-m33
.thumb

.section .isr_vector, "a", %progbits
.type g_pfnVectors, %object
g_pfnVectors:
  .word _estack                /* Initial Stack Pointer */
  .word Reset_Handler         /* Reset Handler */
  .word NMI_Handler           /* NMI Handler */
  .word HardFault_Handler     /* Hard Fault Handler */
  .word Default_Handler       /* MPU Fault Handler */
  .word Default_Handler       /* Bus Fault Handler */
  .word Default_Handler       /* Usage Fault Handler */
  .word 0                     /* Reserved */
  .word 0                     /* Reserved */
  .word 0                     /* Reserved */
  .word 0                     /* Reserved */
  .word SVC_Handler           /* SVCall Handler */
  .word Default_Handler       /* Debug Monitor Handler */
  .word 0                     /* Reserved */
  .word PendSV_Handler        /* PendSV Handler */
  .word SysTick_Handler       /* SysTick Handler */

  /* Add IRQ handlers here if needed */

.size g_pfnVectors, . - g_pfnVectors

/* Stack top */
.section .stack, "a", %progbits
.word 0x20040000              /* Example stack top (adjust for your RAM size) */
.global _estack
_estack = 0x20040000

/* Reset Handler */
.section .text.Reset_Handler
.global Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
  /* Call SystemInit if you have one */
  bl main
  b .

/* Default Handlers */
.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler:
  b .

/* Weak aliases for handlers */
.weak NMI_Handler
.weak HardFault_Handler
.weak SVC_Handler
.weak PendSV_Handler
.weak SysTick_Handler

NMI_Handler = Default_Handler
HardFault_Handler = Default_Handler
SVC_Handler = Default_Handler
PendSV_Handler = Default_Handler
SysTick_Handler = Default_Handler
