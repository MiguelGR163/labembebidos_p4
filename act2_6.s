	.data
	.balign 4
format: .asciz " %d"

x: .int 0
el1: .int 0
el2: .int 0
el3: .int 0
res: .int 0

input1: .asciz "Enter value of x:\n"
output: .asciz "The result is: %d\n"

.text
.global main
.extern printf
.extern scanf
@6x2+9x+2
main:
	push {ip, lr}

	ldr r0, =input1
	bl printf

	ldr r0, =format
	ldr r1, =x
	bl scanf

	ldr r1, =x
	ldr r2, [r1]
	ldr r1, [r1]
	mul r0, r1, r2
	mov r1, r0
	mov r2, #6
	mul r0, r1, r2
	ldr r1, =el1
	str r0, [r1]

	ldr r1, =x
	ldr r1, [r1]
	mov r2, #9
	mul r0, r1, r2
	ldr r1, =el2
	str r0, [r1]

	ldr r1, =el1
	ldr r1, [r1]
	ldr r2, =el2
	ldr r2, [r2]
	add r0, r1, r2
	add r0, r0, #2
	ldr r1, =res
	str r0, [r1]

	ldr r0, =output
	ldr r1, =res
	ldr r1, [r1]
	bl printf

	pop {ip, pc}
