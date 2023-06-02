.include "machine/multiboot_defines.s"

.set MULTIBOOT2_HEADER_LENGTH, (header_end - header_start)
.set MULTIBOOT2_TAG_END_SIZE, 8
.set CHECKSUM, 0x100000000 - (MULTIBOOT2_HEADER_MAGIC + MULTIBOOT_ARCHITECTURE_I386 + MULTIBOOT2_HEADER_LENGTH)

.section .multiboot_header
header_start:
    #.align MULTIBOOT_HEADER_ALIGN
    .long MULTIBOOT2_HEADER_MAGIC
    .long MULTIBOOT_ARCHITECTURE_I386
    .long MULTIBOOT2_HEADER_LENGTH
    .long CHECKSUM

# Tags here

# end tag
#.align MULTIBOOT_TAG_ALIGN
    .short MULTIBOOT_TAG_TYPE_END
    .short 0
    .long MULTIBOOT2_TAG_END_SIZE

header_end:
