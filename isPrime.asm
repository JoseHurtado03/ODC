.data
msg:	.asciiz "Ingresa un número para evaluar si es primo: "
prime:	.asciiz "El numero es primo"
noPrime:	.asciiz "El numero no es primo"
.text
	#Imrpime el saludo
	li   $v0 4
	la   $a0 msg
	syscall
	li   $v0 5
	syscall
	move $t1, $v0
	#Lógica de hallar si es primo o no
	li   $t0 1
	beq  $t1, 1, saltoNo
	beq  $t1, 0, saltoNo
while: 	addi $t0, $t0, 1
	bgt  $t1, $t0, salto
	beq  $t1, $t0, saltoSi
salto:	div  $t1, $t0
	mfhi $t7
	beqz $t7, saltoNo 
	bgtz $t7, while
saltoSi:	la   $a0 prime
	li   $v0, 4
	syscall
	j fin
saltoNo:	la   $a0 noPrime
	li   $v0, 4
	syscall
	j fin
fin:	li   $v0 10
	syscall