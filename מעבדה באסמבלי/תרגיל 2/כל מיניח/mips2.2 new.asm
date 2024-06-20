.data

arr1: .asciiz "ENTER VALUE"
arr2: .asciiz "ENTER OP CODE"
error: .asciiz "ERROR"
.text

begin:
#print "ENTER VALUE"
li $v0, 4
la $a0, arr1
syscall

#read int
li $v0 5
syscall
addi $t5 $v0 0 # $t5 = fst int

#print "ENTER OP CODE"
la $a0 arr2
li $v0 4
syscall

#read op code
li $v0 12
syscall
addi $s0 $v0 0 #s0 = op code




#print "ERROR"
la $a0 error
li $v0 4
syscall

nop