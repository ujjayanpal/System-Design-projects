section .data
    ; Example student record
    roll_number db '12345678'
    marks1 dd 60 ; unsigned byte
    marks2 dd 90 ; unsigned byte
    marks3 dd 75 ; unsigned byte
    average dd 0 ;

section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    ; Calculate the sum of the marks
    mov eax, dword [marks1]
    mov ebx, dword [marks2]
    add eax, ebx
    mov ebx, dword [marks3]
    add eax, ebx
    mov edx, 0
    ;mov dword [average], eax
 
    ; Calculate the average
    mov ebx, 03 ; divisor
    idiv ebx ; divide by 3, quotient is the average

    ; Store the average in the memory location for marks1
    mov dword [average], eax

    ; Display the average
    mov eax, 4 ; write system call
    mov ebx, 1 ; standard output
    mov ecx, marks1 ; address of the marks1 field
    mov edx, 1 ; number of bytes to print (unsigned byte)
    int 0x80 ; execute the system call

    ; Exit
    mov eax, 1 ; exit system call
    xor ebx, ebx ; exit status 0
    int 0x80 ; execute the system call
