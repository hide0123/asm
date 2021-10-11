.text
.globl main

main:
    addi    sp, sp, -16
    la      a0, msg
    sd      ra, 8(sp)
    call    printf
    ld      ra, 8(sp)
    li      a0, 0
    addi    sp, sp, 16
    ret

.data
msg:    .asciz  "hello\n"
