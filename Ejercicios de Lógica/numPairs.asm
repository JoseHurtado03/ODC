.data
saluda:	.asciiz "¡Hola! Los números primos son: "
salto:  .asciiz "\n"
.text
	#Imprime el mensaje
	la   $a0,saluda 
	li   $v0, 4
	syscall
	li   $t0 5     #Candidato primo entre 5 y 99
lazo1:	div  $t1,$t0,2 #Divisores del primo, desde su mitad bajando hacia 2
lazo2:	div  $t0,$t1   #Deja en $lo el cociente y $hi el residuo SIN TOCAR $t0
	mfhi $t2       #Contiene el residuo de la división
	beqz $t2,siga
	subi $t1,$t1,1
	bge  $t1,2,lazo2
	li   $v0 1      #Armando el syscall para desplegar el candidato
	move $a0,$t0
	syscall
	la   $a0,salto
	li   $v0, 4
	syscall
siga:	addi $t0,$t0,2
	ble  $t0,99,lazo1
	#Cierra el programa
	li   $v0,10
	syscall