.data
msg:	.asciiz "Introduza un número entre 111 y 999: "
ans:	.asciiz "El número en unario es: "
.text
	li $v0 4
	la $a0 msg
	syscall
	li $v0 5
	syscall
	move $t0 $v0
	#Lógica #a1
	li $t9 10
	div $t0 $t9
	mfhi $t1
	mflo $t0 
	#a2
	li $t9 10
	div $t0 $t9
	mfhi $t2
	mflo $t0
	#a3
	li $t9 10
	div $t0 $t9
	mfhi $t3
	mflo $t0
	#Imprime el ans
	li $v0 4
	la $a0 ans
	syscall
	#Imprime el unario#
	li $v0 1
	li $a0 1
loop:	
	beqz $t3 floop
	syscall
	addi $t3 $t3 -1
	j loop
floop:	li $v0 1
	li $a0 0
	syscall
loop2:	
	beqz $t2 floop2
	li $v0 1
	li $a0 1
	syscall
	addi $t2 $t2 -1
	j loop2
floop2:	
	li $v0 1
	li $a0 0
	syscall
loop3:	
	beqz $t1 floop3
	li $v0 1
	li $a0 1
	syscall
	addi $t1 $t1 -1
	j loop3
floop3:	li $v0 10
	syscall
	
	