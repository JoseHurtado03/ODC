.data
msg:	.asciiz "Ingresa un número para evaluar si es perfecto: "
perft:	.asciiz "El número es perfecto"
abund:	.asciiz "El número es abundante"
defici:	.asciiz "El número es deficiente"

.text
	#Imprimir saludo y guardar el número a evaluar
	li   $v0 4
	la   $a0 msg
	syscall
	li   $v0 5
	syscall
	move $t7 $v0     #Número a evaluar
	#Lógica de hallar qué tipo de número es  
	li   $t0 0       #Múltiplos
	li   $t1 1       #Auxiliar
while:	beq  $t1 $t7 eval
	div  $t7 $t1
	mfhi $t2         #Resto de la división
	beqz $t2 multi
	bgtz $t2 noMul
multi:	add  $t0 $t0 $t1
	addi $t1 $t1 1
	j while
noMul:	addi $t1 $t1 1
	j while
eval:	beq  $t0 $t7 perf
	blt  $t0 $t7 defi
	bgt  $t0 $t7 abun
perf:	li   $v0 4
	la   $a0 perft
	syscall
	j fin
defi:	li   $v0 4
	la   $a0 defici
	syscall
	j fin
abun:	li   $v0 4
	la   $a0 abund
	syscall
	j fin
fin:	li   $v0 10
	syscall