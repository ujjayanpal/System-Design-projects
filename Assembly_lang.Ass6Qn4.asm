section .data
    ; Matrix X with 2 rows and 3 columns in row major form
    X dd 1, 2, 3, 4, 5, 6
    ; Matrix Y with 3 rows and 4 columns in row major form
    Y dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    ; Matrix Z containing the product with 2 rows and 4 columns in row major form
    Z dd 0, 0, 0, 0, 0, 0, 0, 0
    
section .text
    global main
    
    main:
    mov rbp, rsp; for correct debugging
      mov eax, X
      mov ebx, Y
      mov ecx, 0
      mov edx, 0
      mov esi, 0
      mov edi, 0
    loop_1:
      mov ebp, [eax]
      mov esp, [ebx]
      imul ebp, esp
      add edi, ebp
      add eax, 4
      add ebx, 16
      mov ebp, ecx
      imul ebp, 12
      add ebp, 12
      add ebp, X
      cmp eax, ebp
      jne loop_1
      mov esp, Z
      mov ebp, ecx
      imul ebp, 16
      add esp, ebp
      mov ebp, edx
      imul ebp, 4
      add esp, ebp
      mov [esp], edi
      inc edx
      mov esp, X
      mov ebp, ecx
      imul ebp, 12
      add esp, ebp
      mov eax, esp
      xor esp, esp
      mov esp, Y
      mov ebp, edx
      imul ebp, 4
      add esp, ebp
      mov ebx, esp
      mov edi, 0
      cmp edx, 4
      jne loop_1
      inc ecx
      mov edx, 0
      mov esp, X
      mov ebp, ecx
      imul ebp, 12
      add esp, ebp
      mov eax, esp
      xor esp, esp
      mov esp, Y
      mov ebp, edx
      imul ebp, 4
      add esp, ebp
      mov ebx, esp
      mov edi, 0
      cmp ecx, 2
      jne loop_1
        
    ; Exit the program
    mov eax, 1 ; System call for exit
    xor ebx, ebx ; Return code 0
    int 0x80 ; Call the kernel
