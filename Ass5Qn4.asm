section .data
    vector dd 1, 2, 3, 4, 5 ; example vector
    n equ 5 ; number of elements in the vector
    m dd 0
section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    ; initialize variables
    mov ecx, n ; number of elements left to process
    mov ebx, vector ; address of the vector
    xor eax, eax ; clear accumulator for sum of squares

vector_loop:
    ; square the current element and add it to the accumulator
    mov edx, [ebx] ; load the current element into edx
    imul edx, edx ; square the element
    add eax, edx ; add the squared element to the accumulator

    ; move to the next element
    add ebx, 4 ; increment the pointer to the next element
    dec ecx ; decrement the number of elements left to process
    jnz vector_loop ; jump to vector_loop if there are more elements

    ; print the result
    mov [m], eax;
    mov eax, 4 ; write system call
    mov ebx, 1 ; standard output
    mov ecx, eax ; value to print (sum of squares)
    mov edx, 4 ; number of bytes to print (integer size)
    int 0x80 ; execute the system call