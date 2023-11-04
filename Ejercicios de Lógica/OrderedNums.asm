.data
array: .byte 121, 45, 79, 17, 58, 74, 45, 64, 10, 0
#             0    1   2   3   4   5   6  7    8  9
salto: .asciiz "\n"
.text
li $t0 0 #$t0 va a ser un desplazamiento en memoria, para recorrer el array
 
bucle1: #Está estructurado como un While
	addi $t1, $t0, 1 #Va a ser un desplazamiento que siempre va adelante de $t0
	bucle2:
	lb $t2 array($t0)
	lb $t3 array($t1)
	ble $t2, $t3 saltarmeIntercambio #Se asemeja al funcionamiento de un if
	sb $t2 array($t1)
	sb $t3 array($t0)
	
	saltarmeIntercambio:
	
	addi $t1, $t1, 1
	ble $t1 9 bucle2
addi $t0, $t0, 1
ble $t0 8 bucle1

li $t0 0
bucleImpresion: 
	li $v0, 1
	lb $a0 array($t0)
	syscall
	li $v0 4
	la $a0 salto
	syscall
	addi $t0, $t0, 1
	ble $t0 9 bucleImpresion
li $v0 10
syscall