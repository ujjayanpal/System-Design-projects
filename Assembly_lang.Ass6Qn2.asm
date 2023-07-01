section .data
    ; Define an array of student records
    student_records:
       m1 dd 80, 75, 90, 85, 95   ; Marks1 for 5 students
       m2 dd 70, 85, 80, 90, 75   ; Marks2 for 5 students
       m3 dd 75, 80, 90, 85, 95   ; Marks3 for 5 students
       m4 dd 85, 70, 75, 80, 90   ; Marks4 for 5 students
       m5 dd 90, 85, 95, 70, 75   ; Marks5 for 5 students
    num_students dd 5           ; Define the number of students
    sum dd 0                     ; Define a variable to hold the sum of Marks1
    average dd 0                 ; Define a variable to hold the average of Marks1

section .text
    global main
    main:
    mov rbp, rsp; for correct debugging
        mov ebx,  0  
        mov ebp, 0         ; Initialize a counter for the loop
    loop_start:
        mov eax, [student_records + ebx]   ; Load the Marks1 for the current student
        add [sum], eax           ; Add the Marks1 to the sum
        mov esi, 4
        add ebx, esi
        inc ebp   
        mov [average], eax      ; Increment the counter
        cmp ebp, dword [num_students]   ; Check if all students have been processed
        jne loop_start    
        mov edx, 0      ; If not, go back to the loop start
        mov eax, [sum]
        mov esi, dword [num_students]
        div esi ; Divide the sum by the number of students to get the average
        mov [average], eax      ; Move the result into the average variable

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
