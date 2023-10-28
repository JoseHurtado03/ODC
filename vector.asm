.data
msg:	.asciiz "El vecto ordenado es: "
salto:	.asciiz "\n"
vector:	.word 15,5,200,-3,0

.text
	#$t1= j; $t0 = i *Ver la foto de la pizarra*
	li   $t0 0
lazo1:	addi $t1,$t0,4
lazo2:	lw   $t2,vector($t0)
	lw   $t3,vector($t1)
	ble  $t2,$t3,siga
	#Intercambio
	sw   $t2,vector($t1)
	sw   $t3,vector($t0)
siga:	addi $t1,$t1,4
	ble  $t1,16,lazo2
	addi $t0,$t0,4
	ble  $t0,12,lazo1
	
	li   $t0,0 #Para hacer el loop de despliegue
lazo3:	lw   $a0,vector($t0)
	li   $v0 1
	syscall
	la   $a0,salto
	li   $v0,4
	syscall
	addi $t0,$t0,4
	ble  $t0,16,lazo3
	#Cerrar programa
	li   $v0,10
	syscall
