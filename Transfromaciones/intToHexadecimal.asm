#El usuario debe introducir un número binario como String en complemento a 2 y se debe 
#imprimir como un número hexadecimal.
.data
msg:	.asciiz "Introduce un número binario en complemento a 2: "
jump:	.asciiz "\n"
ans:	.asciiz "El número en hexadecimal es: "
numB:	.space 33
numH:	.space 9
.text
	#Imprime el mensaje
	li $v0 4
	la $a0 msg
	syscall
	#Lee el número binario como String
	li $v0 8
	la $a0 numB
	li $a1 33
	syscall
	#Pasar el string binario a binario en un registro
	li $t0 0 #Lo usamos para ir recorriendo el string
	li $t4 0 #Aquí va quedando el resultado del número
loop:	
	bge $t0 32 fin
	lb $t1 numB($t0)
	addi $t1 $t1 -48 #Porque es un 0 o 1 en ASCII
	sll $t4 $t4 1
	or $t4 $t4 $t1
	addi $t0 $t0 1
	j loop #Cuando termine el bucle, queda en $t4 el número en binario
fin:
	#Aquí pasamos el número binario de $t4 a hexadecimal
	li $t0 0 # $t0 nos va a ir apuntando a cada uno de los espacios de memoria donde tiene que quedar
	li $t1 28 # Es la cantidad de shift hacia la derecha
	li $s0 15 #Máscara, 15 porque son los últimos 4 bits encendidos 1111
loopH:	
	bge $t0 8 finH
	move $t2 $t4
	srlv $t2 $t2 $t1
	and $t2 $t2 $s0 
	blt $t2 10 nro #Si es menor a 10, quiere decir que en hexadecimal es un número
	bge $t2 10 alpha #Si es 10 o mayor, quiere decir que es una letra entre A y F
nro:	addi $t2 $t2 48 #Ahora, es el string del número
	j finCases
alpha:	addi $t2 $t2 55 #Ahora, es el string de la letra
	j finCases
finCases:
	sb $t2 numH($t0) #Guarda el dígito en string en el espacio de memoria reservado
	addi $t1 $t1 -4
	addi $t0 $t0 1
	j loopH
finH:	
	#Imprime el salto
	li $v0 4
	la $a0 jump
	syscall
	#Imprime el mensaje de resultado
	li $v0 4
	la $a0 ans
	syscall
	#Imprime el número en hexadecimal
	li $v0 4
	la $a0 numH
	syscall
	#Cierra el programa
	li $v0 10
	syscall