/*
 * getting_started.ld
 *
 * Simplified linker script for the Atmel SAM4E.
 *
 * Rob Laswick
 * May 2013
 */

MEMORY
{
    FLASH (rx) : ORIGIN = 0x00400000, LENGTH = 1M
    SRAM (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
    .text :
    {
        *(.text*)
    } > FLASH

    _stack_start = ALIGN (ORIGIN(SRAM) + LENGTH(SRAM), 8);
}

