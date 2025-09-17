
ENTRY(Reset_Handler)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 1024K
  RAM (rwx)  : ORIGIN = 0x20000000, LENGTH = 256K
}

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
    KEEP(*(.init))
    KEEP(*(.fini))
  } > FLASH

  .eh_frame :
  {
    *(.eh_frame*)
  } > FLASH

  .ARM.exidx :
  {
    *(.ARM.exidx*)
  } > FLASH

  .data : AT (ADDR(.ARM.exidx) + SIZEOF(.ARM.exidx))
  {
    *(.data*)
  } > RAM

  .bss :
  {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM

  .stack :
  {
    . = ALIGN(8);
    KEEP(*(.stack*))
    . = . + 0x1000;
  } > RAM

  .heap :
  {
    _end = .;
    . = . + 0x1000;
  } > RAM
}
