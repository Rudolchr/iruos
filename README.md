# IruOS
A simple imultiboot 2 compatible operating system kernel that shall support
uefi on an x86\_64 processor written in rust.
This kinda follows https://os.phil-opp.com/

### Dependencies
- Rust
- clang for assembly
- qemu


What works yet:
- [x] booting from grub2
- [ ] switching to long mode
- [ ] writing to VGA mode from rust code
