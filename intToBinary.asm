.data
msg:	.asciiz "Ingresa un número para transformalo a binario: "
ans:	.asciiz "El número en binario es: "
.text
	#Imprime el saludo
	li $v0 4
	la $a0 msg
	syscall
	#Guarda el número en $t0
	li $v0 5
	syscall
	move $t0 $v0
	#Imprime ans
	li $v0 4
	la $a0 ans
	syscall
	#Pasar a Binario
	li $t1 31
loop:	bltz $t1 fin
	move $t2 $t0     #Creamos una copia de $t0
	srlv $t2 $t2 $t1 #Hacemos shift y and para verificar si el bit es 0 o 1
	and $t2 $t2 1
	#Imprimimos el 0 o 1
	li $v0 1
	move $a0 $t2
	syscall
	#Restamos 1 a $t1 para que se vaya movindo y evalúe todos los números
	addi $t1 $t1 -1
	j loop
fin:	li $v0 10
	syscall
	 
	