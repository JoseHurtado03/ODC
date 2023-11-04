.data
msg:	.asciiz "Ingresa un n�mero para evaluar si es perfecto: "
perft:	.asciiz "El n�mero es perfecto"
noPerft:	.asciiz "El n�mero no es perfecto"

.text
	#Imprimir saludo y guardar el n�mero a evaluar
	li   $v0 4
	la   $a0 msg
	syscall
	li   $v0 5
	syscall
	move $t7 $v0     #N�mero a evaluar
	#L�gica de hallar si es N�mero Perfecto  
	li   $t0 0       #M�ltiplos
	li   $t1 1       #Auxiliar
while:	beq  $t1 $t7 eval
	div  $t7 $t1
	mfhi $t2         #Resto de la divisi�n
	beqz $t2 multi
	bgtz $t2 noMul
multi:	add  $t0 $t0 $t1
	addi $t1 $t1 1
	j while
noMul:	addi $t1 $t1 1
	j while
eval:	beq  $t0 $t7 siPerf
	#Imprimir si NO es perfecto
	li   $v0 4
	la   $a0 noPerft
	syscall
	j fin
siPerf:	li   $v0 4
	la   $a0 perft
	syscall
	j fin
fin:	li   $v0 10
	syscall