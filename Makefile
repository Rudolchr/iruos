AS = clang
LD = ld.lld

LDFLAGS= -n -T $(LINKER_SCRIPT)
ASFLAGS = -c -target x86_64-unknown-none

BIN = bin
SRC = src
MACHINE = machine
ISODIR = $(BIN)/isodir
ISODIR_KERNEL = $(ISODIR)/boot/iruos.bin
TARGET_FOLDER = target

LINKER_SCRIPT = $(MACHINE)/linker.ld
ISO=iruos.iso
KERNEL_BIN=iruos.bin

AS_SOURCE = $(wildcard $(MACHINE)/*.s) \
	    $(wildcard $(MACHINE)/*/.s)

OBJECT_FILES = $(patsubst %.s, $(BIN)/%.o, $(notdir $(AS_SOURCE)))

VPATH = $(dir $(AS_SOURCE))

.PHONY: build iso debug-run debug bios-run clean

bios-run: iso
	qemu-system-x86_64 -accel kvm -cdrom $(BIN)/$(ISO)

iso: build
	cp $(BIN)/$(KERNEL_BIN) $(ISODIR_KERNEL)
	grub-mkrescue -o $(BIN)/$(ISO) $(ISODIR)

debug: ASFLAGS+=-g3
debug: ASFLAGS+=-gdwarf64	# necessary for lldb to debug assembly files
debug: iso

debug-lldb: debug
	qemu-system-x86_64 -accel kvm -cdrom $(BIN)/$(ISO) -s -S & sleep 1 && rust-lldb $(BIN)/$(KERNEL_BIN) -s lldb.script

debug-gdb: debug
	qemu-system-x86_64 -accel kvm -cdrom $(BIN)/$(ISO) -s -S & sleep 1 && rust-gdb $(BIN)/$(KERNEL_BIN) -x gdb.script

build: $(OBJECT_FILES)
	$(LD) $(LDFLAGS) $^ 

$(BIN)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(BIN)/*.{o,bin,iso}
	rm -f $(ISODIR_KERNEL)
