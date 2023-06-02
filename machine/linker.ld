ENTRY(kernel_entry)
OUTPUT_FORMAT(elf64-x86-64)
OUTPUT(bin/iruos.bin)

SECTIONS {
    . = 1M;

    .boot : ALIGN(4K) {
        *(.multiboot_header)
    }

    .text : ALIGN(4K) {
        *(.text)
    }

    .rodata : ALIGN(4K) {
        *(.rodata)
    }

    .data : ALIGN(4K) {
        *(.data)
    }

    .bss : ALIGN(4K) {
        *(COMMON)
        *(.bss)
    }
}
