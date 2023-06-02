.global _check_cpuid
.global get_vendor
.global _check_long_mode

.include "machine/magic_numbers.s"

.section .text
_check_cpuid:
    .code32
    pushfd
    pushfd
    xorl $CPUID_SUPPORT, (%esp)
    popfd
    pushfd
    pop %eax
    xorl (%esp), %eax
    popfd
    andl $CPUID_SUPPORT, %eax
    cmp $0, %eax
    je _no_cpuid
    ret

get_vendor:
    # asks cpuid for the vendor string
    # TODO make it rust call compatible
    movl $CPUID_VENDOR_STRING, %eax
    cpuid
    ret

_check_long_mode:
    # check if cpuid supports long mode
    movl $CPUID_SUPPORT_EXTENDED, %eax
    cpuid
    cmp $CPUID_SUPPORT_LONG_MODE, %eax
    jb _no_long_mode
    mov $CPUID_SUPPORT_LONG_MODE, %eax
    cpuid
    test $1 << 29, %edx
    jz _no_long_mode
    ret
