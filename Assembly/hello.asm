section .data
    msg db "Hello, World!", 10    ; string + newline (10 = '\n')
    len equ $ - msg               ; length of the string

section .text
    global _start

_start:
    ; write(1, msg, len)
    mov rax, 1                    ; syscall number: sys_write
    mov rdi, 1                    ; file descriptor: stdout
    mov rsi, msg                  ; pointer to the message
    mov rdx, len                  ; number of bytes
    syscall

    ; exit(0)
    mov rax, 60                   ; syscall number: sys_exit
    xor rdi, rdi                  ; exit code 0
    syscall
