  .global fibo
  .type %function
fibo:
  cmp r0, #2
  movlt r0, #1
  bxlt lr
  push {r4, r5, lr}
  mov r5, r0
  sub r0, #2
  bl fibo
  mov r4, r0
  sub r0, r5, #1
  bl fibo
  add r0, r4
  pop {r4, r5, lr}
  bx lr

  .global main
  .type %function
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
