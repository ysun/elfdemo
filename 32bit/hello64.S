/* hello_minimal.s */
    .global _start
    .text
_start:
    mov     $1, %rax              # __NR_write = 1
    mov     $1, %rdi              # fd = 1 (stdout)
    lea     msg(%rip), %rsi       # buf = &msg（RIP 相对寻址，避免硬编码绝对地址）
    mov     $len, %rdx            # count = len
    syscall

    mov     $60, %rax             # __NR_exit = 60
    xor     %rdi, %rdi            # status = 0
    syscall

    .section .rodata
msg:
    .ascii  "Hello, world\n"
    .set len, .-msg

