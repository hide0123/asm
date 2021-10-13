.text
.global main
.extern printf

@----------------------------
@ r0 = table
@ r1 = table length
@ r2 = table length - 4
@ r3 = outer loop counter
@ r4 = inner loop counter
@ r5 = inner loop counter - 4
@ r6, r7 = arrays to compare
@----------------------------

@----------------------------------------------------------------

main:
        push    {r4-r7, lr}     @ store registers onto the stack

        ldr     r0, =table
        ldr     r1, =len
        sub     r2, r1, #4
        mov     r3, #0

@----------------------------------------------------------------

outer:  mov     r4, r2          @ the startline of the outer loop

@---------------------------------------------------------------- 
       
inner:  sub     r5, r4, #4      @ the startline of the inner loop
        ldr     r6, [r0, r4]   
        ldr     r7, [r0, r5]

        cmp     r6, r7
        strlt   r7, [r0, r4]
        strlt   r6, [r0, r5]

        sub     r4, r4, #4
        cmp     r4, r3
        bgt     inner           @ the endline of the inner loop

@--------------------------------------------------------------

        add     r3, r3, #4
        cmp     r3, r2
        blt     outer           @ the endline of the outer loop

@--------------------------------------------------------------

        mov     r4, #0
        mov     r5, #0
        lsr     r6, r1, #2      @ r6 <- (r1 >> 2)

@--------------------------------------------------------------

output: cmp     r5, r6

        beq     exit            @ goto exit if r5 == r6

        ldr     r0, =num        @ param 0
        ldr     r1, =table
        ldr     r1, [r1, r4]    @ param 1

        bl      printf          @ call printf

        add     r4, r4, #4
        add     r5, r5, #1

        b       output          @ goto output

@-------------------------------------------------------------

exit:   ldr     r0, =nl     @ param 0 ("\n")
        bl      printf      @ call printf
        mov      r0, #0     @ good return code
        pop     {r4-r7, pc} @ load registers from the stack

@-------------------------------------------------------------

.data

table:  .word   9, -8, -72, 256, -128, 24

len = . - table             @ table length

num:    .asciz  "%d "
nl:     .asciz  "\n"

@-------------------------------------------------------------
