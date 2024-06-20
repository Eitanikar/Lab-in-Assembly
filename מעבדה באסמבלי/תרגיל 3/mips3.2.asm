# Eitan ikar
data 
	des: .byte 1 2 4 8 16
	
	len:.word 5
	
	InvoiceSeries:.asciiz "The series is an invoice series."
	
	EngineeringSeries:.asciiz "The series is an engineering series." 
	
	NotASeries:.asciiz "The series is not a series at all"
	
.text

	la $a0 des
	lw $a1 len
	#Checking whether the series is an invoice
	add $t7 $a1 $zero
	sub $t7 $t7 2
	invoice:
	        lb $t1 0($a0)
 	        lb $t2 1($a0)
 	        lb $t3 2($a0)
	        sub $a2 $t1 $t2
	        sub $a3 $t2 $t3
	        beq $t7 1 endInvoice
	        bne $a2 $a3 engineering
	            sub $t7 $t7 1   
	            addi $a0 $a0 1
	j invoice
	
	#Checking whether the series is an engineering
	add $t7 $a1 $zero
	sub $t7 $t7 2
	engineering:
	        lb $t1 0($a0)
 	        lb $t2 1($a0)
 	        lb $t3 2($a0)
	        div $t2 $t1
	        mflo $a2
	        div $t3 $t2
	        mflo $a3
	        bne $a2 $a3 end
	            sub $t7 $t7 1
	            addi $a0 $a0 1    
	        beq $t7 1 endEngineering
	j engineering
	
	
	endInvoice:
	              la $a0 InvoiceSeries
	              li $v0 4
	              syscall
	              
	              li $v0 10
	              syscall 
	
	endEngineering:
	              la $a0 EngineeringSeries
	              li $v0 4
	              syscall
	           
	              li $v0 10
	              syscall
	 
	end:
		la $a0 NotASeries
	              li $v0 4
	              syscall
		
	              li $v0 10
	              syscall 
	              
	nop              
