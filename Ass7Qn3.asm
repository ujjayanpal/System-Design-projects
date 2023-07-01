section .data
   X dd 5
   Z dd 0
section .text
global main
Factorial:
    cmp eax, 0
    je case_1
    jne case_2
    case_1:
      mov ebx, 1
      ret
    case_2:
      dec eax
      call Factorial
      inc eax
      imul ebx, eax
      ret
    
main:
    mov rbp, rsp; for correct debugging
    ;write your code here
    mov eax, [X]
    mov ebx, 0
    call Factorial
    mov [Z], ebx
    xor rax, rax
    ret