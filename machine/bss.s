.section .bss
.align 16
stack_bottom:
    .zero 4096 * 4 # reserve 16KiB of stack space with value 0
stack_top:
