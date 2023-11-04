.data
msg:	.asciiz "Introduce un número entero: "
bin:	.asciiz "El número en binario es: "
hexa:	.asciiz "El número en hexadecimal es: "
salto:	.asciiz "\n"
.text
	#Imprime el texto de msg
	li $v0 4
	la $a0 msg
	syscall
	#Guarda el número ingresado
	li $v0 5
	syscall
	move $t0 $v0
	#Imprime el texto de bin
	li $v0 4
	la $a0 bin
	syscall
	#Imprime el entero como binario
	li $v0 35
	move $a0 $t0
	syscall
	#Imprime el texto de salto
	li $v0 4
	la $a0 salto
	syscall
	#Imprime el texto de bin
	li $v0 4
	la $a0 hexa
	syscall
	#Imprime el entero como hexadecimal
	li $v0 34
	move $a0 $t0
	syscall
	#Cierra el programa
	li $v0 10
	syscall