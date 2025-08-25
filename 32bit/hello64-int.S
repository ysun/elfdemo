/* hello_int80_64.s */
#    .global _start
#    .text
#_start:
#    # write(1, msg, len)
#    mov     $1,  %rax          # __NR_write (x86_64) = 1
#    mov     $1,  %rbx          # fd = 1 (stdout)
#    lea     msg(%rip), %rcx    # buf = &msg     (RIP 相对寻址，位置无关)
#    mov     $len, %rdx         # count = len
#    int     $0x80
#
#    # exit(0)
#    mov     $60, %rax          # __NR_exit (x86_64) = 60
#    xor     %rbx, %rbx         # status = 0
#    int     $0x80
#
#    .section .rodata
#msg:
#    .ascii  "Hello, world\n"
#    .set    len, .-msg


/* hello_int80_64.s   (AT&T 语法) */
    .global _start
    .text
_start:
    # write(1, msg, len)  —— 用 i386 号：write = 4
    mov     $4,  %eax          # __NR_write (i386) = 4
    mov     $1,  %ebx          # fd = 1 (stdout)
    lea     msg(%eip), %ecx    # buf = &msg
    mov     $len, %edx         # count = len
    int     $0x80

    # exit(0)  —— 用 i386 号：exit = 1
    mov     $1,  %eax          # __NR_exit (i386) = 1
    xor     %ebx, %ebx         # status = 0
    int     $0x80

    .section .rodata
msg:
    .ascii  "Hello, world\n"
    .set    len, .-msg

