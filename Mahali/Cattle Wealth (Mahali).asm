.data
prompt:     .asciz "Enter number of cattle: "
errorMsg:  .asciz "Error: Number of cattle cannot be negative.\n"
notEnough: .asciz "Not enough for bohali\n"
small:      .asciz "Small herd\n"
wealthy:    .asciz "Wealthy cattle owner\n"

.text
.globl _start

_start:
    # Print prompt (cout << "Enter number of cattle: ")
    la a0, prompt
    li a7, 4
    ecall
    
    # Read integer input (cin >> cattle)
    li a7, 5
    ecall
    mv t0, a0          # t0 = cattle
    
    # Check if cattle < 0 (if (cattle < 0))
    blt t0, zero, error
    
    # Check if cattle < 10 (if (cattle < 10))
    li t1, 10
    blt t0, t1, notEnoughLabel
    
    # Check if cattle < 50 (else if (cattle < 50))
    li t1, 50
    blt t0, t1, smallLabel
    
    # Otherwise, wealthy (else)
    j wealthyLabel

notEnoughLabel:
    # Print "Not enough for bohali"
    la a0, notEnough
    li a7, 4
    ecall
    j exit

smallLabel:
    # Print "Small herd"
    la a0, small
    li a7, 4
    ecall
    j exit

wealthyLabel:
    # Print "Wealthy cattle owner"
    la a0, wealthy
    li a7, 4
    ecall
    j exit

error:
    # Print error message (cout << "Error: Number of cattle cannot be negative.")
    la a0, errorMsg
    li a7, 4
    ecall
    
exit:
    # Exit program
    li a7, 10
    ecall