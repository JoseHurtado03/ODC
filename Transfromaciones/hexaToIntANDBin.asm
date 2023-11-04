#    Lea un numero introducido por el usuario como una cadena de texto, el numero estará escrito en hexadecimal.
# Convertirlo a un entero y luego a binario en un registro. Guarde los número resultantes en $t0 e imprímalos.
.data
msg:	.asciiz "Introduce un número en hexadecimal: "
jump:	.asciiz "\n"
num:	.space 9 #Aquí se guarda el número hexadecimal
ans:	.asciiz "El número en decimal es: "
ansB:	.asciiz "El número en binario es: "
.text
	#Imprimir mensaje
	la $a0 msg
	li $v0 4
	syscall
	#Leer string de hexadecimal
	li $v0 8
	la $a0 num
	li $a1 9
	syscall
	#Impríme el salto de línea
	la $a0 jump
	li $v0 4
	syscall
	#Pasar de string hexadecimal a entero decimal
	li $t0 0 #Aquí se va guardando el entero, de 4bits en 4bits
	li $t1 0 #Desplazamiento para recorrer el string
loop:
	bge $t1 8 fin
	lb $t2 num($t1) #En $t2 se guarda el caracter en ASCII de la posición $t1 del num
	bgt $t2 64 alpha
	j numeric
alpha:	
	addi $t2 $t2 -55
	j finCases
numeric:	
	addi $t2 $t2 -48
	j finCases
finCases:
	sll $t0 $t0 4 #Cada dígito hexadecimal son 4 bits porque el más alto es F = 15 = 1111
	or $t0 $t0 $t2
	addi $t1 $t1 1 #Mueve el desplazamiento
	j loop
fin:
	#Imprímo el mensaje de respuesta
	li $v0 4
	la $a0 ans
	syscall
	#Imprímo el número decimal
	li $v0 1
	move $a0 $t0
	syscall
	#Ahora a BINARIO
	li $v0 4
	la $a0 jump
	syscall
	li $v0 4
	la $a0 ansB
	syscall
	#Imprimir número en binario
	li $t7 31 #Cantidad de desplazamiento
loopB:	
	blt $t7 0 finB
	move $t3 $t0 #Copia del número a transformar en binario
	srlv $t3 $t3 $t7
	and $t3 $t3 1
	li $v0 1
	move $a0 $t3
	syscall
	addi $t7 $t7 -1
	j loopB
finB:	
	#Fin del programa
	li $v0 10
	syscall