    AREA problem_six, CODE, READONLY
    ENTRY
    ;EXPORT main

    ; function to check if a number is prime
    prime:
        PUSH {LR}        ; save the return address
        CMP r0, #1       ; special cases: 1 is not prime
        BEQ not_prime
        CMP r0, #2       ; 2 is prime
        MOVEQ r0, #1
        BREQ prime_end
        MOV r1, #2       ; start at 2
    loop:
        MOV r2, r0       ; copy input to r2
        SDIV r2, r1      ; divide input by divisor
        MUL r3, r1, r2   ; multiply quotient by divisor
        CMP r3, r0       ; compare to input
        BEQ not_prime    ; if divisible, not prime
        ADD r1, #1       ; try next divisor
        CMP r1, r0       ; check if divisor greater than input
        BGT prime_end    ; if divisor greater than input, number is prime
        B loop           ; continue looping
    not_prime:
        MOV r0, #0       ; input is not prime
    prime_end:
        POP {PC}         ; restore the return address and return

    ; main function
    ;main
       
    MOV r2, #5           ; input size
    LDR r3, =my_array    ; load the address of the array
    MOV r4, #0           ; initialize loop counter
    ADD r5, r3, r2, LSL #2 ; calculate the end of the array address

loop:    
    LDR r0, [r3], #4     ; load the next element into r0 and increment the array address
    BL  prime            ; call the prime function
    CMP r0, #1           ; check if r0 is prime
    BNE not_prime        ; if r0 is not prime, skip printing
    MOV r0, r4           ; load loop counter
    ADD r0, #1           ; increment loop counter to get the current index
    MOV r1, r4, LSL #2   ; multiply loop counter by 4 to get the current element's address
    ADD r1, r1, r3       ; add the current element's address to the array address to get the address of the current element
    LDR r1, [r1]         ; load the current element into r1
    MOV r0, #0x0A        ; ASCII code for newline character
    BL  putchar         ; print a newline
    BL  put_dec         ; print the index of the current prime element
    MOV r0, #':'
    BL  putchar         ; print a colon
    BL  put_dec         ; print the value of the current prime element
    B done              ; continue looping

not_prime:
    ADD r4, #1           ; increment loop counter
    CMP r3, r5           ; check if end of array is reached
    BNE loop             ; if not, continue looping

done:
    B Stop               ; stop the program

    ; function to print an integer in decimal format
    put_dec:
       
