# conditional.asm
# A conditionally branching program in MIPS Assembly for CS64
#
# Data Area - allocate and initialize variables
.data
    prompt: .asciiz "Enter an integer: "

# Text Area (i.e. instructions)
.text
main:
    li $v0, 4 
    la $a0, prompt # syscall for print_string 
    syscall

    li $v0, 5 # syscall for read_int
    syscall
    move $t0, $v0 

    srl $t1, $t0, 2 # shift R by 2
    sll $t1, $t1, 2 # shift L by 2
    beq $t0, $t1, divisibleByFour  #campare with original if div by 4

    li $t2, 7 # mult by 7
    mult $t0, $t2
    mflo $t3
    j printOfRes

divisibleByFour:
    li $t2, 4
    mult $t0, $t2 #div by 4 => mult by 4
    mflo $t3

printOfRes:
    move $a0, $t3
    li $v0, 1
    syscall #result printing

exit:
    li $v0, 10 # syscall for exit code 10
    syscall 