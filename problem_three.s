    AREA sum_program, CODE, READONLY
    ENTRY
    ;EXPORT main

    ; function to compute the sum of two numbers
    ; takes two arguments by reference and returns the result in r0
    sum:
        PUSH {LR}        ; save the return address
        LDR r0, [r0]     ; load the first argument from memory
        LDR r1, [r1]     ; load the second argument from memory
        ADD r0, r0, r1   ; add the two arguments
        POP {PC}         ; restore the return address and return

    ; main function
    ;main
        MOV r0, #5       ; first number
        MOV r1, #7       ; second number
        STR r0, =arg1    ; store the first number in memory
        STR r1, =arg2    ; store the second number in memory
        LDR r0, =arg1    ; load the memory address of the first argument
        LDR r1, =arg2    ; load the memory address of the second argument
        BL sum           ; call the sum function with the memory addresses
        ; at this point, r0 should hold the sum of the two arguments

    Stop B Stop         ; stop the program

    ; input arguments passed by reference
    AREA input_args, DATA, READWRITE
    arg1 DCD 0
    arg2 DCD 0
