#Primero pasar de string hexadecimal a hexadecimal
#Contar los cuartetos de bits que tengan al menos 1bit encendido
#Calcular factorial

.data
msg:	.asciiz "Ingresa un número: "
num:	.space 9 #Cada dígito hexadecimal pesa 4bits, por lo que solo se pueden introducir *8* dígitos + 1 de caracter nulo
msgR:	.asciiz "Cantidad de cuartetos con un bit encendido: "
msgF:	.asciiz "Factorial: "
salto:	.asciiz "\n"
.text
	li $v0 4
	la $a0 msg
	syscall
	
	li $v0 8
	la $a0 num
	li $a1 9
	syscall
	li $t0 0 
	li $t1 0 #Desplazamiento para recorrer el registro
loop:		bge $t1 8 fin
		lb $t2 num($t1) #Guardo en $t2 el caracter ASCII con mi dígito hexadecimal
		blt $t2 58 digitNum
		b digitAlpha

digitNum:	addi $t2 $t2 -48
		b finCasos
digitAlpha:	addi $t2 $t2 -55
		b finCasos
finCasos:	sll $t0 $t0 4
		or $t0 $t0 $t2
		
		addi $t1 $t1 1
		b loop
fin:	
	li $t1 0  #Contador de bits
	li $t2 28
	li $t3 15 #0xF Esa es la MÁSCARA
loopAis:
	bltz $t2 finAis
	
	move $t4 $t0 #Copia que vamos a modificar
	srlv $t4 $t4 $t2 #Desplazamos para dejar 4 bits lo más a la derecha
	and $t4 $t4 $t3
	beqz $t4 saltarIncre
	addi $t1 $t1 1 
saltarIncre:
	addi $t2 $t2 -4
	b loopAis
finAis:	
	li $v0 4
	la $a0 salto
	syscall
	li $v0 4
	la $a0 msgR
	syscall
	li $v0 1
	move $a0 $t1
	syscall
	#Factorial
	li $t2 1
	li $t3 1
loopF:	bgt $t3 $t1 finF
	mul $t2 $t2 $t3
	addi $t3 $t3 1
	j loopF
finF:	
	li $v0 4
	la $a0 salto
	syscall
	li $v0 4
	la $a0 msgF
	syscall
	li $v0 1
	move $a0 $t2
	syscall