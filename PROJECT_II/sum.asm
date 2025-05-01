section .bss
    input_buf   resb 32
    print_buf   resb 32
    total       resq 1

section .data
    prompt      db "Enter a number (1-100): ", 0
    prompt_len  equ $ - prompt

    error_msg   db "Invalid input. Please enter a number between 1 and 100.", 10, 0
    error_len   equ $ - error_msg

    result_msg  db "The sum is: ", 0
    result_len  equ $ - result_msg

    newline     db 10

section .text
    global _start

_start:
    xor rbx, rbx            ; rbx = sum

    ; Get first two numbers
    call get_valid_input
    add rbx, rax

    call get_valid_input
    add rbx, rax

    ; Loop 4 times for more inputs
    mov rcx, 4
.loop_more:
    call get_valid_input
    add rbx, rax
    loop .loop_more

    ; Store total sum
    mov [total], rbx

    ; Print "The sum is: "
    mov rsi, result_msg
    mov rdx, result_len
    call print

    ; Convert sum to string and print it
    mov rdi, rbx                    ; number to convert
    lea rsi, [print_buf + 31]       ; buffer end
    call itoa
    mov rdx, rax                    ; length returned in rax
    lea rsi, [print_buf + 31]
    sub rsi, rdx                    ; pointer to start of string
    call print

    ; Print newline
    call newline_print

    ; Exit syscall
    mov rax, 60
    xor rdi, rdi
    syscall

; ========= SUBROUTINES ===========

get_valid_input:
    push rbx
.get_input:
    ; Print prompt
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; Read user input
    mov rax, 0
    mov rdi, 0
    lea rsi, [input_buf]
    mov rdx, 32
    syscall

    ; Convert string to integer
    lea rsi, [input_buf]
    call atoi
    mov rbx, rax

    ; Check if 1 <= rbx <= 100
    cmp rbx, 1
    jl .invalid
    cmp rbx, 100
    jg .invalid

    ; Valid input
    mov rax, rbx
    pop rbx
    ret

.invalid:
    ; Print error message
    mov rax, 1
    mov rdi, 1
    mov rsi, error_msg
    mov rdx, error_len
    syscall
    jmp .get_input

; atoi: convert string in RSI to integer in RAX
atoi:
    xor rax, rax
    xor rcx, rcx
.convert_loop:
    mov bl, [rsi + rcx]
    cmp bl, 10         ; newline
    je .done
    cmp bl, '0'
    jb .done
    cmp bl, '9'
    ja .done
    sub bl, '0'
    imul rax, rax, 10
    add rax, rbx
    inc rcx
    jmp .convert_loop
.done:
    ret

; itoa: convert integer RDI to string ending at RSI
; returns string length in RAX
itoa:
    mov rcx, 10
    mov rbx, rsi
    xor rdx, rdx
    mov rax, rdi
.reverse:
    xor rdx, rdx
    div rcx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    test rax, rax
    jnz .reverse
    mov byte [rbx], 0
    mov rax, rbx
    sub rax, rsi       ; length
    ret

; print: print string at RSI with length RDX
print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

; print newline
newline_print:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret
