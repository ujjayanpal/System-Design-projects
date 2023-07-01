section .data
min_array dd 0, 0, 0, 0, 0
max_array dd 0, 0, 0, 0, 0
matrix dd 10, 15, 5, 8, 3,6, 7, 9, 12, 2,0, 10, 6, 2, 11,3, 8, 4, 1, 1,7, 13, 4, 5, 9
a dd 0
section .text
global main

main:
    mov rbp, rsp; for correct debugging
    lea edx, matrix ; ebx points to the beginning of the matrix
    mov ecx, 0      ; ecx is the number of rows in the matrix
outer_loop:
     ; save the outer loop counter
        ; edx points to the beginning of the current row
     ; ecx is the number of columns in the matrix
    mov al, [edx]
  ; initialize min with the first element in the row
    mov ah, [edx]   ; initialize max with the first element in the row
    mov ebp, 0
inner_loop:
    cmp al, [edx]   ; compare the current element with min
    jl skip_min     ; skip if the current element is greater than or equal to min
    mov al, [edx]
; update min with the current element
skip_min:
    cmp ah, [edx]   ; compare the current element with max
    jg skip_max     ; skip if the current element is less than or equal to max
    mov ah, [edx]   ; update max with the current element
skip_max:
    add edx, 4      ; move to the next element in the row
    inc ebp
    cmp ebp, 5
    jne inner_loop ; repeat for all columns

       ; restore the outer loop counter
    mov [min_array + 4*ecx], al
    mov [max_array + 4*ecx], ah
    inc ecx 
    mov eax, 5
    cmp ecx, eax  
      ; decrement the outer loop counter
    jne outer_loop  ; repeat for all rows

    ; the smallest and largest elements of each row are now in the al and ah registers
    ; you can output them using the appropriate system call or store them in memory for later use
    ; the program should end with an exit system call

    mov eax, 1      ; system call for exit
    xor ebx, ebx    ; exit code 0
    int 0x80        ; call kernel