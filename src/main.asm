%include "includes/config.inc"

%ifdef OS_MACOS
    %define ENTRY_POINT _main
%else
    %define ENTRY_POINT main
%endif

global ENTRY_POINT

%ifdef OS_MACOS
    extern _printf
    %define PRINTF _printf
%else
    extern printf
    %define PRINTF printf
%endif

section .data
    message     db "Hello from ASM!", 10, 0
    format_str  db "%s", 0

section .text

ENTRY_POINT:
; ------- 64-bit Calling Convention (Linux/macOS)
%ifdef ARCH_X86_64
	push rbp
	mov rbp, rsp
	mov rdi, format_str
	mov rsi, message
	xor rax, rax
	call PRINTF
	leave

	%ifdef OS_MACOS
		mov rax, 0x2000001
		xor rdi, rdi
		syscall
	%else
		mov rax, 60
		xor rdi, rdi
		syscall
	%endif

; ------- 32-bit Calling Convention (cdecl) -------
%elifdef ARCH_X86
	push ebp
	mov ebp, esp

	push message
	push format_str
	call PRINTF
	leave

	%ifdef OS_MACOS
		mov eax, 1
		xor ebx, ebx
		syscall
	%else
		mov eax, 1
		xor ebx, ebx
		int 0x80
	%endif

%elifdef ARCH_AARCH64
    ; AArch64 not use
    mov     x8, 93
    mov     x0, %1
    svc     #0
%else
        %error "Unsupported architecture for PROGRAM"
%endif
