.data
arr1: .byte 1 2 3 4 5 6

.text
la $a0 arr
la $a3 arr
li $a1 6 # $a1 = size

# sll:  $t1 = $a1's value moved by 2 bytes:
sll $s0 $a1 2    # 8* 2*2
add $s0 $s0 $a0 #32+ 1001000
again:
sub $s0 $s0 4
slt $s1 $s0 $a3
bne $s1 $zero print
#equal 
begin:
addi $a0 $ao -1 #size -1
addi $a0 $zero again
lw $t0 0($a0)
lw $t1 4($a0)
slt $t3 $t0 $t1
beq $t3 $zero swap
addi $a0 $a0 4
j begin

swap:
sw $t1 0($a0)
sw $t0 4($a0)
addi $a0 $a0 4
j begin

end:
nop


