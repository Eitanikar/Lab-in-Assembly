.data
str:.asciiz "the biggest number is:"

.text
la $a0 array
li $a1 6
lb $t0 0($a0)
lb $t1 1($a0)

begin: #loop for all the array
bgt $t0 $t1 bigger #if %$t0 bigger then $t1 jump to bigger
la $a0 1($a0)
lb $t0 0($a0)
lb $t1 1($a0)
addi $t2 $t2 1
beq $t2 $a1 finish #if we end the array we jump to the end of the program and print the biggest number
j begin

bigger: #here we cheange the biggest number to the value of $t0
addi $v0 $t0 0
la $a0 array+1
lb $t0 0($a0)
lb $t1 1($a0)
addi $t2 $t2 1
beq $t2 $a1 finish #if we end the array we jump to the end of the program and print the biggest number
j begin


finish: #print the biggest number
addi $t3 $v0 0
li $v0, 4 #print calling for string
la $a0,str # address of the string to print.
syscall

#print the biggest number:
addi $a0 $t3 0
li $v0 , 1 #print int.
syscall