#    Lea un numero introducido por el usuario como una cadena de texto, el numero estará escrito en
# hexadecimal. Convertirlo a un entero en un registro. Guarde el número resultante en $t0 e imprímalo.
.data
msg:	.asciiz "Introduce un número en hexadecimal: "
jump:	.asciiz "\n"
num:	.space 9 #Aquí se guarda el número hexadecimal
ans:	.asciiz "El número en decimal es: "
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
	#Cierro el programa
	li $v0 10
	syscall 