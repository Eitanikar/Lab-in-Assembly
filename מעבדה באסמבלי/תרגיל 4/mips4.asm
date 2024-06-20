.data 
arr1: .byte 
arr2: .byte 
arr3: .asciiz "Enter 2 numbers and action:"
arr4: .asciiz "ERROR"
arr5: .asciiz "The result is:"
.text

#print: "Enter..."
li $v0 4
la $a0 arr3
syscall

#read fst num
li $v0 5
syscall
or $a1 $zero $v0

#read scnd num
li $v0 5
syscall
or $a2 $zero $v0

read_fun:
#read action
li $v0 12
syscall
add $a3 $v0 $a3 

#our operators:
li $s0 '+'
li $s1 '*'
li $s2 '^'

#menu
beq $a3 $s0  j.plus
beq $a3 $s1 j.multy
beq $a3 $s2 j.pwr
j error

j.plus:
jal sum
j print_reasult

j.multy:
jal multy
j print_reasult

j.pwr:
jal pwr
j print_reasult

#----------------
print_reasult:
or $t0 $zero $v0 #save $v0 into $t0:

#print "The result is:"
li $v0 4
la $a0 arr5
syscall

#print the result
li $v0 1
add $a0 $t0 $0
#la $a0 arr5
syscall
j end

#------------

sum:  
addi $sp $sp -4 
sw $t0 0($sp)  

add $v0 $a2 $a1 

lw $t0 0($sp) 
addi $sp $sp 4 
jr $ra 

#------------

multy: 

addi $k0 $a2 0 #save $a2 (the 2nd argument) in $k0
addi $a2 $a1 0 # $a2 = $a1
addi $t8 $t8 1 # start the counter from 1 and not from 0

addi $sp $sp -4 #free space in stack for restoring the the data afterwoards
sw $ra 0($sp)

begin_m:
jal sum
addi $a1 $v0 0 #adding the previous result into $a1
addi $t8 $t8 1 #counter++
beq $t8 $k0 return_m 
bne $t8 $k0 begin_m

return_m:
lw $ra 0($sp) 
addi $sp $sp 4 
jr $ra

#------------

pwr:
addi $k1 $a2 0 #save $a2 (the 2nd argument) in $k1
addi $a2 $a1 0 # $a2 = $a1
addi $t9 $t9 1 # start the counter from 1 and not from 0

addi $sp $sp -4 #free space in stack for restoring the the data afterwoards
sw $ra 0($sp)

begin_p:
jal multy
addi $a1 $v0 0 #adding the previous result into $a1
addi $t9 $t9 1 #counter++
beq $t9 $k1 return_m 
bne $t9 $k1 begin_m

return_p:
lw $ra 0($sp) 
addi $sp $sp 4 
jr $ra



#---------------------
error:
#print: "ERROR"
li $v0 4
la $a0 arr4
syscall
j read_fun

end:
nop 