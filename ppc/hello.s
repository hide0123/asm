.text
.global main

main:
    lis     3, msg@ha
    addi    3, 3, msg@l
    mflr    0
    stw     0, 8(1)
    bl      printf
    lwz     0, 8(1)
    mtlr    0
    li      3, 0
    blr

.data
msg:    .asciz  "hello\n"
