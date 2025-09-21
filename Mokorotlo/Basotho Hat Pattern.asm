.data
prompt:     .asciz "Enter height n: "
errorMsg:  .asciz "Error: Height must be positive.\n"
star:       .asciz "*"
space:      .asciz " "
newLine:    .asciz "\n"

.text
.globl _start

_start:
    # Print prompt (cout << "Enter height n: ")
    la a0, prompt
    li a7, 4
    ecall
    
    # Read integer input (cin >> n)
    li a7, 5
    ecall
    mv t0, a0          # t0 = n
    
    # Check if n <= 0 (if (n <= 0))
    ble t0, zero, error
    
    # Initialize outer loop counter i = 1 (for (int i = 1; i <= n; i++))
    li t1, 1           # t1 = i
    
outerLoop:
    # Check if i > n, exit loop (i <= n)
    bgt t1, t0, exit
    
    # Initialize inner loop for spaces (for (int j = 0; j < n - i; j++))
    sub t2, t0, t1     # t2 = n - i
    li t3, 0           # t3 = j
    
spaceLoop:
    # Check if j >= n - i, exit loop
    bge t3, t2, innerStarLoop
    
    # Print space (cout << " ")
    la a0, space
    li a7, 4
    ecall
    
    # Increment j (j++)
    addi t3, t3, 1
    j spaceLoop

innerStarLoop:
    # Initialize inner loop for stars (for (int j = 0; j < 2 * i - 1; j++))
    li t4, 2           # t4 = 2
    mul t4, t1, t4     # t4 = 2 * i
    addi t4, t4, -1    # t4 = 2 * i - 1
    li t3, 0           # t3 = j
    
starLoop:
    # Check if j >= 2*i-1, exit loop
    bge t3, t4, endInnerLoops
    
    # Print star (cout << "*")
    la a0, star
    li a7, 4
    ecall
    
    # Increment j (j++)
    addi t3, t3, 1
    j starLoop

endInnerLoops:
    # Print newline (cout << endl)
    la a0, newLine
    li a7, 4
    ecall
    
    # Increment i (i++)
    addi t1, t1, 1
    j outerLoop

error:
    # Print error message (cout << "Error: Height must be positive.")
    la a0, errorMsg
    li a7, 4
    ecall
    
exit:
    # Exit program
    li a7, 10
    ecall