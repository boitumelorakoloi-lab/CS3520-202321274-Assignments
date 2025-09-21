.data
prompt:     .asciz "Enter quantity of grains in litres: "
errorMsg:  .asciz "Error: Quantity cannot be negative.\n"
resultMsg: .asciz " litres makes "
remainMsg: .asciz " makokopo with "
litresMsg: .asciz " litres remaining.\n"


.text
.globl _start

_start:
    # Print prompt (cout << "Enter quantity of grains in litres: ")
    la a0, prompt
    li a7, 4
    ecall
    
    # Read integer input (cin >> litres)
    li a7, 5
    ecall
    mv t0, a0          # t0 = litres
    
    # Check if litres < 0 (if (litres < 0))
    blt t0, zero, error
    
    # Calculate makokopo and remainder
    li t1, 20          # t1 = MAKOKOPO_SIZE = 20
    div t2, t0, t1     # t2 = makokopo = litres / 20
    rem t3, t0, t1     # t3 = remainder = litres % 20
    
    # Print original litres value
    mv a0, t0
    li a7, 1
    ecall
    
    # Print " litres makes "
    la a0, resultMsg
    li a7, 4
    ecall
    
    # Print makokopo count
    mv a0, t2
    li a7, 1
    ecall
    
    # Print " makokopo with "
    la a0, remainMsg
    li a7, 4
    ecall
    
    # Print remainder
    mv a0, t3
    li a7, 1
    ecall
    
    # Print " litres remaining.\n"
    la a0, litresMsg
    li a7, 4
    ecall
    
    j exit

error:
    # Print error message (cout << "Error: Quantity cannot be negative.")
    la a0, errorMsg
    li a7, 4
    ecall
    
exit:
    # Exit program (return 0 or return 1)
    li a7, 10
    ecall
    
    