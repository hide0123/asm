.text
.globl main

main:
    lea     msg(%rip), %rdi
    sub     $8, %rsp
    call    printf
    add     $8, %rsp
    xor %eax, %eax
    ret

.data
msg:    .asciz  "hello\n"
