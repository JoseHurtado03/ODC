#Cuenta bits
.data
msg:	.asciiz "Introduzca el entero para contar sus bits: "
salto:	.asciiz "\n"
msgR:	.asciiz "La cantidad de bits prendidos es: "
.text
	li $s0 1 #Este es el valor de la máscara
	#Imprime el saludo
	la $a0 msg
	li $v0 4
	syscall
	#Guardar el número en $t0
	li $v0 5
	syscall
	move $t0 $v0 #En $t0 está el número al que contaremos sus bits
	li $t1 31    #Es el desplazamiento que tengo que hacer para aislar cada bit
	li $t2 0     #Es la cantidad de bits prendidos
count:	
	bltz $t1 finCount
	move $t3 $t0
	srlv $t3 $t3 $t1
	and  $t3 $t3 $s0 #Máscara
	add  $t2 $t2 $t3
	addi $t1 $t1 -1
	b count
finCount:	
	la $a0 salto
	li $v0 4
	syscall
	la $a0 msgR
	li $v0 4
	syscall
	li $v0 1
	move $a0 $t2
	syscall
	li $v0 10
	syscall
