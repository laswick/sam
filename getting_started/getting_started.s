/*
 * getting_started.s
 *
 * Simplified startcode for the Atmel SAM4E.
 *
 * Rob Laswick
 * May 2013
 */

    .syntax unified
    .thumb

    .extern _stack_start

    .text
    .org 0
    .align 2
vector_table:
    .word _stack_start
    .word _reset_handler

    .org 0x100
    .align 2
    .word 0xabcdef55

    .align 2
    .thumb_func
_reset_handler:

disable_watchdog:
    ldr r0, =0x400e1854
    ldr r1, =0
    str r1, [r0]

configure_blue_led:
    ldr r0, =0x400e0e10
    ldr r1, =0x00000001
    str r1, [r0]
    ldr r0, =0x400e0e30
    str r1, [r0]

first_break:
    ldr r0, =0x400e0e34
    str r1, [r0]

end_loop:
    b end_loop

    .end
