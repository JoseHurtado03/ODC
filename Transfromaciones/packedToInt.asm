#Haz un programa que lo convierta a binario y lo imprima en pantalla con syscall 1
.data
msg:	.asciiz "Ingresa un número: "
ans:	.asciiz "El equivalente en entero binario es: "
.text
	li $t0 0x0001270d #-1270
	andi $t1 $t0 0x0f
	beq $t1 13 isNegative #Registro de trabajo para aislar Nibbles
	li $t2 1
	j positive #siga
isNegative:
	li $t2 -1
positive:
	srl $t0 $t0 4
	li $t3 1 #Potencias de 10	
	li $t4 0 #Contiene la suma de nibbles *10**algo
loop:	and $t1 $t0 0x0f
	mul $t1 $t1 $t3 
	add $t4 $t4 $t1
	mul $t3 $t3 10
	srl $t0 $t0 4
	ble $t3 10000000 loop

	la $a0 ans
	li $v0 4
	syscall
	mul $t4 $t4 $t2
	move $a0 $t4
	li $v0 1
	syscall
	li $v0 10
	syscall