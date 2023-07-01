section .data
section .data
    P dd 1
    Q dd 1
    R dd 2
    S dd 1
    T dd 1
    U dd 1
    V dd 1
    W dd 1
    Z dd 1
section .text
global main
main:
    mov rbp, rsp; for correct debugging2    mov rbp, rsp; for correct debugging
    ;write your code here
        ; Load variables into registers
    mov eax, dword [P]
    mov ebx, dword [Q]
    mov ecx, dword [R]
    mov edx, dword [S]
    mov esi, dword [T]
    mov edi, dword [U]
    mov ebp, dword [V]
    mov esp, dword [W]

    ; Compute (P+Q)*(R-S)+T
    add eax, ebx        ; EAX = P+Q
    sub ecx, edx        ; ECX = R-S
    imul eax, ecx       ; EAX = (P+Q)*(R-S)
    add eax, esi        ; EAX = (P+Q)*(R-S)+T

    ; Compute T/U
    xor edx, edx        ; Zero out EDX for division
    div edi             ; EDX:EAX = T/U

    ; Compute V*W
    imul ebp, esp       ; EBX = V*W

    ; Compute Z = (P+Q)*(R-S)+T/U-V*W
    sub eax, ebx        ; EAX = (P+Q)*(R-S)+T/U-V*W
    mov dword [Z], eax  ; Store result in Z

    ; Exit program
    mov eax, 0          ; Return value
    ret
