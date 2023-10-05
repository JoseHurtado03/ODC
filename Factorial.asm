.data
msg:	.asciiz "Bienvenido al programa para calcular Factorial. Introduce un número: "
ans:	.asciiz "\nEl factorial de el número ingresado es: "
.text
	#Imrpime el mensaje msg
	li $v0 4
	la $a0 msg
	syscall
	#Se almacena el num introducido y lo guarda en $t5
	li $v0 5
	syscall
	move $t5, $v0
	#Se calcula el factorial y se guarda en $t0
	li $t0 1 #Aquí se acumulan los productos
	la $t1, ($t5)
lazo:   mul $t0,$t0,$t1
	addi $t1,$t1,-1
	bge $t1,2,lazo #Brach if greater or equal
	#Imprime el mensaje ans
	li $v0 4
	la $a0 ans
	syscall
	#Imprime el resultado del factorial
	li $v0 1 
	la $a0, ($t0)
	syscall
	