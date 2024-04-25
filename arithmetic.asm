# arithmetic.asm
# A simple calculator program in MIPS Assembly for CS64
# notes/to-do: use mips syscall table, undrstnd ref data, syntax, 
.text
main:
    
    li $v0, 5 #for 1st int
    syscall
    move $t0, $v0       # t0 = i1
    
    li $v0, 5 #for 2nd int
    syscall
    move $t1, $v0       # t1 = i2
    
    sra $t2, $t1, 1     # t2 = i2 / 2
    sub $t3, $t0, $t2   # t3 = i1 - (i2 / 2)
    sll $t4, $t3, 5     # t4 = $t3 * 32
    addi $t5, $t4, 4    # t5 = $t4 + 4
    
    move $a0, $t5
    li $v0, 1 #syscall print_int
    syscall

exit:
    li $v0, 10 # syscall for exit code 10
    syscall