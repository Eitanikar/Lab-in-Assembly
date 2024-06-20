.data 
arr1:.asciiz "ENTER VALUE "
arr2:.asciiz "ENTER OP CODE "
arr3:.asciiz "the result is: "
arr4:.asciiz "ERROR"
newLine:.asciiz "\n"

.text
li $t0 '+'
li $t1 '-'
li $t2 '*'
li $t3 '@'

#print: enter value
li $v0, 4 
la $a0,arr1
syscall

#get from the user number
li $v0 5
syscall
addi $t4 $v0 0

loop:
#print: enter op code
li $v0, 4 
la $a0,arr2
syscall

#get from the user op code
li $v0 12
syscall
addi $s0 $v0 0 #s0 save the op code

la $a0 newLine
addi $v0 $0 4
syscall
beq $s0 $t3 equal

#print: enter value
li $v0, 4 
la $a0,arr1
syscall

#get from the user the seccond number
li $v0 5
syscall
addi $t5 $v0 0

#go to the right command
beq $s0 $t0 sum
beq $s0 $t1 subt
beq $s0 $t2 multi

sum:
add $t4 $t4 $t5
beq $s1 $t3 equal
j loop

subt:
sub $t4 $t4 $t5
beq $s1 $t3 equal
j loop

multi:
mult $t4 $t5
mfhi $t6
mflo $t7
add $t4 $t4 $t7
sra $t7 $t7 31
bne $t6 $t7 error
j loop

equal:
#print: the result is:
li $v0, 4 
la $a0,arr3
syscall
addi $a0 $t4 0
li $v0 1
syscall

error: #print ERROR and exit
li $v0, 4 
la $a0,arr4
syscall
