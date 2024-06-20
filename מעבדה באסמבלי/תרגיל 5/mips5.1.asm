.data
arr1:.byte 9 8 7 6 7 8 9 8 7 6 5 4 3 2 1 2 3 4 5 6
basic_code:.space 40
arr3: .word 2 3 6
.text
loop:
li $a1 6 #counter
la $a0 basic_code
#read 6 digits:
li $v0 5
syscall
sb $v0 0($a0)
addi $a0 $a0 1
addi $a1 $a1 -1
beq $a1 $zero check
j loop

check:
#counter of basic_code
#counter of main block
#counter of match
nop