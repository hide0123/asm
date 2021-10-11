.text
.global main

main:
    str     x30, [sp, #-8]!
    ldr     x0, =msg
    bl      printf
    mov     x0, #0
    ldr     x30, [sp], #8
    ret

.data
msg:    .asciz  "hello\n"
