.global kernel_entry
.global _no_cpuid
.global _no_long_mode

.include "machine/multiboot_defines.s"
.include "machine/bss.s"
.include "machine/magic_numbers.s"

.section .text
kernel_entry:
    mov $stack_top, %esp
    call check_multiboot
    call _check_cpuid
    call _check_long_mode
    movl $0x2F4B2F4F, (0xB8000)
    hlt

error:
    # Print ERROR: with red background and white foreground
    # al contains error number
    movl $0x4F524F45, (0xB8000)
    movl $0x4F4F4F52, (0xB8004)
    movl $0x4F3A4F52, (0xB8008)
    movl $0x4F204F20, (0xB800C)
    movb %al, (0xB800E)
    hlt

no_multiboot:
    movl $0x31, %eax # error value 1
    jmp error

_no_cpuid:
    movl $0x32, %eax # error value 2
    jmp error

_no_long_mode:
    movl $0x33, %eax
    jmp error

check_multiboot:
    cmp $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
    jne no_multiboot
    ret
