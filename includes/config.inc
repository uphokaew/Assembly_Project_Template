%ifdef __APPLE__
    %define OS_MACOS 1
    %define SYSCALL_PREFIX 0x2000000
%else
    %define OS_LINUX 1
    %define SYSCALL_PREFIX 0
%endif

%ifidn __OUTPUT_FORMAT__, elf32
    %define ARCH_X86 1
    %define BIT_32 1
    BITS 32
%elifidn __OUTPUT_FORMAT__, elf64
    %define ARCH_X86_64 1
    %define BIT_64 1
    BITS 64
%elifidn __OUTPUT_FORMAT__, macho32
    %define ARCH_X86 1
    %define BIT_32 1
    BITS 32
%elifidn __OUTPUT_FORMAT__, macho64
    %define ARCH_X86_64 1
    %define BIT_64 1
    BITS 64
%elifidn __OUTPUT_FORMAT__, aarch64
    %define ARCH_AARCH64 1
    %define BIT_64 1
    BITS 64
%else
    %error "Unsupported output format"
%endif