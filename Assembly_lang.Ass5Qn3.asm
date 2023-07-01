section .data
    op db '-' ; the operator character
    X dd 10 ; integer X
    Y dd 2 ; integer Y
    Z dd 0 ; integer Z

section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    ;mov rbp, rsp; for correct debugging
    ; read in the operator and X and Y values
    ;mov eax, 3 ; read system call
    ;mov ebx, 0 ; standard input
    ;mov ecx, op ; destination buffer
    ;mov edx, 1 ; read one byte
    ;int 0x80 ; execute the system call

    ;mov eax, 3 ; read system call
    ;mov ebx, 0 ; standard input
    ;mov ecx, X ; destination buffer
    ;mov edx, 4 ; read 4 bytes (integer size)
    ;int 0x80 ; execute the system call

    ;mov eax, 3 ; read system call
    ;mov ebx, 0 ; standard input
    ;mov ecx, Y ; destination buffer
    ;mov edx, 4 ; read 4 bytes (integer size)
    ;int 0x80 ; execute the system call

    ; perform the operation based on the operator character
    cmp byte[op], '+'
    je add_numbers
    cmp byte[op], '-'
    je sub_numbers
    cmp byte[op], '*'
    je mul_numbers
    cmp byte[op], '/'
    je div_numbers
    cmp byte[op], '%'
    je mod_numbers
    jmp default_case

add_numbers:
    mov eax, [X]
    add eax, [Y]
    mov [Z], eax
    jmp end_switch

sub_numbers:
    mov eax, [X]
    sub eax, [Y]
    mov [Z], eax
    jmp end_switch

mul_numbers:
    mov eax, [X]
    imul eax, [Y]
    mov [Z], eax
    jmp end_switch

div_numbers:
    mov eax, [X]
    cdq ; set edx to 0 or -1 depending on sign of eax
    idiv dword [Y]
    mov [Z], eax
    jmp end_switch

mod_numbers:
    mov eax, [X]
    cdq ; set edx to 0 or -1 depending on sign of eax
    idiv dword [Y]
    mov [Z], edx
    jmp end_switch

default_case:
    mov eax, 0
    mov [Z], eax

end_switch:
    ; print the result
    mov eax, 4 ; write system call
    mov ebx, 1 ; standard output
    mov ecx, [Z] ; value to print
    mov edx, 4 ; number of bytes to print (integer size)
    int 0x80 ; execute the system call

    ; exit
    mov eax, 1 ; exit system call
    xor ebx, ebx ; exit status 0
    int 0x80 ; execute the system call
