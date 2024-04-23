# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
#

.data
    prompt1: .asciiz ""
    prompt2: .asciiz ""

.text
.globl main
main:
    # Print prompt for the first number
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read the first integer (x)
    li $v0, 5
    syscall
    move $t0, $v0       # Store x in $t0
    
    # Print prompt for the second number
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read the second integer (y)
    li $v0, 5
    syscall
    move $t1, $v0       # Store y in $t1
    
    # Calculate y/2 using arithmetic right shift
    sra $t2, $t1, 1     # $t2 = y / 2
    
    # Calculate x - (y/2)
    sub $t3, $t0, $t2   # $t3 = x - (y / 2)
    
    # Calculate 32 * (x - (y/2)) using left shift
    sll $t4, $t3, 5     # $t4 = $t3 * 32
    
    # Add 4 to the result
    addi $t5, $t4, 4    # $t5 = $t4 + 4
    
    # Print the result
    move $a0, $t5
    li $v0, 1
    syscall

exit:
    # Exit SPIM
    li $v0, 10
    syscall