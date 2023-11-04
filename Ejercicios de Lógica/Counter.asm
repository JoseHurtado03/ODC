.data
salto:	.asciiz "\n"
.text
	#En $t1 vamos a tener un contador de los ciclos (vueltas)
	li $t1 1
	#Contador en $t0, que va del 1 al 10
	li $t0 1
while:	li $v0 1
	#Se imprime el valor de $t0
	move $a0 $t0
	syscall
	#Imprime el salto de línea
	li $v0 4
	la $a0 salto
	syscall
	addi $t0 $t0 1 #Incrementamos $t0
	#Syscall que funciona como timer
	li $v0 32
	li $a0 1000 #Los segundos se expresan en milisegundos
	syscall
	#Llamada al bucle
	ble $t0 10 while
	#Reinicia el contador para repetir el conteo
	li $t0 1
	addi $t1 $t1 1
	#Haces que al reiniciar el contador, el programa espere 2 segundos
	li $v0 32
	li $a0 2000
	syscall
	#Rompes el bucle
	ble $t1 3 while
	#Termina el programa
	li $v0 10
	syscall