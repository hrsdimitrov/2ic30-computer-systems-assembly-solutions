// itoa.s
// Adam Watkins 
// December 2024

// A simple program to convert a single integer to its ASCII equivalent

.global     main

.text

main:     
        LDR     R1, =the_value  @ Load R1 with the address of the array (1st element)
        LDR     R0, [R1]        @ Load R0 with the value of the 1st element
        BL		itoa            @ Call the function
                             
exit:
    @ If using the RPI, uncomment the lines with the MOV and SWI instructions
    @ If using the simulator, comment the lines with the MOV and SWI instructions
@   MOV     R7, #1          @ Place code for Exit into R7
@   SWI     0               @ Make a system call to end the program
    @ If using the RPI, comment the line with B exit
    @ If using the simulator, uncomment the line with B exit
    B       exit


@@@@ itoa: 		Convert integer to ASCII hex character
@ Parameters: 
@   R0: Integer value (assumed to be 0-15)
@ Returns:
@   R0: ASCII character value of provided integer
itoa:
        CMP     R0, #0x09       @ Compare the number with the number 9
        ADDLS   R0, #0x30       @ If the number is <= 9, add the value of '0' to it
        ADDGT   R0, #0x37       @ It the number is >9, adds the value of 'A'-10 to it
        MOV     PC, LR

.data

the_value:    .word   12
