section .data
    E dd 1
    F dd 1
    G dd 0
    U dd 0
    V dd 1
    W dd 5
    X dd 5

section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    ; Load variables into registers
    mov eax, dword [E]
    mov ebx, dword [F]
    mov ecx, dword [G]
    mov edx, dword [U]
    mov esi, dword [V]
    mov edi, dword [W]
    mov ebp, dword [X]

    ; Check if (U<V) && (W==X)
    cmp edx, esi
    jge else_block      ; Jump to else block if U>=V
    cmp edi, ebp
    jne else_block      ; Jump to else block if W!=X

    ; Compute G = E+F
    add eax, ebx        ; EAX = E+F
    mov dword [G], eax  ; Store result in G
    jmp end_block       ; Jump to end block

else_block:
    ; Compute G = E-F
    sub eax, ebx        ; EAX = E-F
    mov dword [G], eax  ; Store result in G

end_block:
    ; Exit program
    mov eax, 0          ; Return value
    ret
