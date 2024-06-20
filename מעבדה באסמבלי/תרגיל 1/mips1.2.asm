.data
str: .asciiz "the sum is:"

.text 
begin:
li $v0 5 #get from the user input
syscall
beq $v0 0 finish
slti $t1 $v0 100 #if true $t1 =1, if false $t1=0
slti $t2 $v0 -99 #we need $t1=1 & $t2=0
beq $t1 0 begin
beq $t2 1 begin
add $t3 $t3 $v0 #add the number to the sum
j begin

finish:
#print 
li $v0, 4 # print: 
la $a0,str # address of "the sum is:".
syscall

addi $a0 $t3 0
#print the sum:
li $v0 , 1 #print int.
syscall
nop


