.data
	mensaje: .asciiz "¡Hola! Introduce un número para evaluar si es primo\n"

.text
la $a0 mensaje
li $v0 4
syscall

li $v0 5
syscall
move $t0 $v0

li $t1 2
loop:
	div $t0, $t1
	mfHi $t4
	bez $t4 NoPrimo
	addi $t1, $t1, 1