# conditional.asm
# A conditionally branching program in MIPS Assembly for CS64
#
# Data Area - allocate and initialize variables
.data
    prompt: .asciiz "Enter an integer: "

# Text Area (i.e. instructions)
.text
.globl main
main:
    # Print the prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read the integer input
    li $v0, 5
    syscall
    move $t0, $v0       # Store the input in $t0

    # Check if the input is divisible by 4
    # x % 4 == 0 can be checked by x & 3 == 0
    andi $t1, $t0, 3
    beqz $t1, divisible_by_four  # If $t1 == 0, go to divisible_by_four

    # If not divisible by 4, multiply input by 7
    li $t2, 7
    mult $t0, $t2
    mflo $t3
    j print_result

divisible_by_four:
    # If divisible by 4, multiply input by 4
    li $t2, 4
    mult $t0, $t2
    mflo $t3

print_result:
    # Print the result
    move $a0, $t3
    li $v0, 1
    syscall

exit:
    # Exit SPIM
    li $v0, 10
    syscall