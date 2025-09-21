.data
prompt:     .asciz "Enter a number in the range (1-7): "
errorMsg:  .asciz "\nError: Please enter a number between 1 and 7.\n"
Mantaha:    .asciz "Mantaha\n"
Labobeli:   .asciz "Labobedi\n"
Laboraro:   .asciz "Laboraro\n"
Labone:     .asciz "Labone\n"
Labohlano:  .asciz "Labohlano\n"
Moqebelo:   .asciz "Moqebelo\n"
Sontaha:    .asciz "Sontaha\n"

.text
.globl _start

_start:
    # Print prompt (cout << "Enter a number (1-7): ")
    la a0, prompt
    li a7, 4
    ecall
    
    # Read integer input (cin >> dayNumber)
    li a7, 5
    ecall
    mv t0, a0          # t0 = dayNumber
    
    # Check if input is 1
    li t1, 1
    beq t0, t1, case1
    
    # Check if input is 2
    li t1, 2
    beq t0, t1, case2
    
    # Check if input is 3
    li t1, 3
    beq t0, t1, case3
    
    # Check if input is 4
    li t1, 4
    beq t0, t1, case4
    
    # Check if input is 5
    li t1, 5
    beq t0, t1, case5
    
    # Check if input is 6
    li t1, 6
    beq t0, t1, case6
    
    # Check if input is 7
    li t1, 7
    beq t0, t1, case7
    
    # Default case (error)
    j error

case1:
    la a0, Mantaha
    j printDay

case2:
    la a0, Labobeli
    j printDay

case3:
    la a0, Laboraro
    j printDay

case4:
    la a0, Labone
    j printDay

case5:
    la a0, Labohlano
    j printDay

case6:
    la a0, Moqebelo
    j printDay

case7:
    la a0, Sontaha
    j printDay

printDay:
    # Print the corresponding day name in Sesotho
    li a7, 4
    ecall
    j exit

error:
    # Print error message (default case in switch)
    la a0, errorMsg
    li a7, 4
    ecall
    
exit:
    # Exit program
    li a7, 10
    ecall