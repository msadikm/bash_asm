.intel_syntax noprefix
.globl _start

.section .text

_start:
loop:
	// write(1, &prompt, 2)
	mov rax, 1
	mov rdi, 1
	mov rsi, offset prompt
	mov rdx, 2
	syscall

	// read(0, &input_buffer, 1000)
	mov rax, 0
	mov rdi, 0
	mov rsi, offset input_buffer
	mov rdx, 1000
	syscall

	mov BYTE PTR [input_buffer + rax -1], 0

	// write(1, &command, 50)
	mov rax, 59
	mov rdi, offset command
	mov rsi, 0
	mov rdx, 0
	syscall

	jmp loop

	// exit(0)
	mov rax, 60
	mov rdi, 0
	syscall

.section .data
prompt:
	.string "> "
hacker:
	.string "hacker\n"
command:
	.ascii "/bin/"
input_buffer:
	.space 1000

