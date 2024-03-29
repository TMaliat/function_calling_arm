    AREA problem_two, CODE, READONLY
    ENTRY
    ;EXPORT main

    ; function to compute the sum of two numbers
    ; takes two arguments by value and returns the result in r0
    sum:
        PUSH {LR}        ; save the return address
        ADD r0, r0, r1   ; add the two arguments
        POP {PC}         ; restore the return address and return

    ; main function
    ;main
        MOV r0, #5       ; first argument
        MOV r1, #7       ; second argument
        BL sum           ; call the sum function with the arguments
        ; at this point, r0 should hold the sum of the two arguments

    Stop B Stop         ; stop the program
