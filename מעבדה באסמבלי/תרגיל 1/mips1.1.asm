.data 0x10010020
block1: .word 10 20 30 40 50 0

.data 0x10010080
block2: .word

.text
la $a0 block1
la $a1 block2
li $v0 0

begin:
lw $t0 0($a0)
sw $t0 0($a1)
beq $t0 $zero end

addi $v0 $v0 1
addi $a0 $a0 4
addi $a1 $a1 4
j begin

end:
nop