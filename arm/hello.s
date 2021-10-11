.text
.global main

main:
    push    {lr}
    ldr     r0, =msg
    bl      printf
    mov     r0, #0
    pop     {pc}

.data
msg:    .asciz  "hello\n"
