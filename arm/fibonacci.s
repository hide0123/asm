fibo:
  cmp r0, #2
  bxls lr
  push {r4, r5, lr}
  mov r0, r4
  sub r0, #2
  bl fibo
  mov r5, r0
  sub r0, r4, #1
  bl fibo
  mov r1, r5
  add r0, r1
  pop {r4, r5, lr}
  bx lr
 
main:
  push {lr}
  mov r0, #10
  bl fibo
  mov r1, r0
  ldr r0, =Fmt
  bl printf
  pop {lr}
  bx lr
  
.data
Fmt: .asciz "%d\n"
