#Pasar de decimal a hexadecimal#
.data
msg:	.asciiz "Introduce un número entero: "
ans:	.asciiz "El número en hexadecimal es: "
jump:	.asciiz "\n"
numH:	.space 9
.text
	#Imprimir mensaje
	li $v0 4
	la $a0 msg
	syscall
	#Leer el entero
	li $v0 5
	syscall
	move $t0 $v0 #En $t0 está el número que queremos en hexadecimal
	#Imprimir salto
	li $v0 4
	la $a0 jump
	syscall
	#Lógica de pasar de int a hexadecimal#
	li $t1 0 #Para apuntar a donde debe guardarse
	li $t7 28 #Para el shift
	li $t6 15 #0000...0000 1111
loop:	
	bge $t1 8 fin
	move $t2 $t0
	srlv $t2 $t2 $t7
	and $t2 $t2 $t6
	bgt $t2 9 alpha
	j nro
alpha:	
	addi $t2 $t2 55
	j finCases
nro:	addi $t2 $t2 48
	j finCases
finCases:
	sb $t2 numH($t1)
	addi $t7 $t7 -4
	addi $t1 $t1 1
	j loop
fin:	
	#Imprimir mensaje ans
	li $v0 4
	la $a0 ans 
	syscall
	#Imprimir número hexadecimal
	li $v0 4
	la $a0 numH
	syscall
	#Cierra el programa
	li $v0 10
	syscall
	