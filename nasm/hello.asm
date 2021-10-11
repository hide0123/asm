section .text
global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, size
    syscall
    mov rax, 60
    mov rdi, 0
    syscall

section .data
msg db 'hello', 0xA
size equ $ - msg
