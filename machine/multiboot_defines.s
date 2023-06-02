.set MULTIBOOT_SEARCH,  			32768
.set MULTIBOOT_HEADER_ALIGN,			8

/* The magic field should contain this.  */
.set MULTIBOOT2_HEADER_MAGIC,			0xe85250d6

/* This should be in %eax.  */
.set MULTIBOOT2_BOOTLOADER_MAGIC,		0x36d76289

/* Alignment of multiboot modules.  */
.set MULTIBOOT_MOD_ALIGN,			0x00001000

/* Alignment of the multiboot info structure.  */
.set MULTIBOOT_INFO_ALIGN,			0x00000008

/* Flags set in the 'flags' member of the multiboot header.  */

.set MULTIBOOT_TAG_ALIGN,                  8
.set MULTIBOOT_TAG_TYPE_END,               0
.set MULTIBOOT_TAG_TYPE_CMDLINE,           1
.set MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME,  2
.set MULTIBOOT_TAG_TYPE_MODULE,            3
.set MULTIBOOT_TAG_TYPE_BASIC_MEMINFO,     4
.set MULTIBOOT_TAG_TYPE_BOOTDEV,           5
.set MULTIBOOT_TAG_TYPE_MMAP,              6
.set MULTIBOOT_TAG_TYPE_VBE,               7
.set MULTIBOOT_TAG_TYPE_FRAMEBUFFER,       8
.set MULTIBOOT_TAG_TYPE_ELF_SECTIONS,      9
.set MULTIBOOT_TAG_TYPE_APM,               10
.set MULTIBOOT_TAG_TYPE_EFI32,             11
.set MULTIBOOT_TAG_TYPE_EFI64,             12
.set MULTIBOOT_TAG_TYPE_SMBIOS,            13
.set MULTIBOOT_TAG_TYPE_ACPI_OLD,          14
.set MULTIBOOT_TAG_TYPE_ACPI_NEW,          15
.set MULTIBOOT_TAG_TYPE_NETWORK,           16
.set MULTIBOOT_TAG_TYPE_EFI_MMAP,          17
.set MULTIBOOT_TAG_TYPE_EFI_BS,            18
.set MULTIBOOT_TAG_TYPE_EFI32_IH,          19
.set MULTIBOOT_TAG_TYPE_EFI64_IH,          20
.set MULTIBOOT_TAG_TYPE_LOAD_BASE_ADDR,    21

.set MULTIBOOT_HEADER_TAG_END,                  0
.set MULTIBOOT_HEADER_TAG_INFORMATION_REQUEST,  1
.set MULTIBOOT_HEADER_TAG_ADDRESS,              2
.set MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS,        3
.set MULTIBOOT_HEADER_TAG_CONSOLE_FLAGS,        4
.set MULTIBOOT_HEADER_TAG_FRAMEBUFFER,          5
.set MULTIBOOT_HEADER_TAG_MODULE_ALIGN,         6
.set MULTIBOOT_HEADER_TAG_EFI_BS,               7
.set MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI32,  8
.set MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS_EFI64,  9
.set MULTIBOOT_HEADER_TAG_RELOCATABLE,          10
 
.set MULTIBOOT_ARCHITECTURE_I386,    0
.set MULTIBOOT_ARCHITECTURE_MIPS32,  4
.set MULTIBOOT_HEADER_TAG_OPTIONAL,  1
 
.set MULTIBOOT_LOAD_PREFERENCE_NONE,    0
.set MULTIBOOT_LOAD_PREFERENCE_LOW,     1
.set MULTIBOOT_LOAD_PREFERENCE_HIGH,    2
 
.set MULTIBOOT_CONSOLE_FLAGS_CONSOLE_REQUIRED,      1
.set MULTIBOOT_CONSOLE_FLAGS_EGA_TEXT_SUPPORTED,    2