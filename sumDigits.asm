.data
msg:	.asciiz "Ingrese un n�mero para sumar sus d�gitos: "
answ:	.asciiz "La suma de los d�gitos es: "
.text
	#Imprime msg
	li   $v0 4
	la   $a0 msg
	syscall
	#Guarda el n�mero
	li   $v0 5
	syscall
	move $t0 $v0
	#L�gica de sumar los d�gitos
	li   $t1 0 #Contador
while:	beqz $t0 ans
	div  $t0 $t0 10
	mfhi $t2
	add  $t1 $t1 $t2
	j while
	#Imprime el resultado
ans:	li   $v0 4
	la   $a0 answ
	syscall
	li   $v0 1
	move $a0 $t1
	syscall
	#Cierra el programa
	li $v0 10
	syscall