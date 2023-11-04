.data
array: .asciiz "Hola mundo José"
#             0    1   2   3   4   5   6  7    8  9
salto: .asciiz "\n"
.text
li $t0 0 #$t0 va a ser un desplazamiento en memoria, para recorrer el array
 
bucle1: #Está estructurado como un While
	addi $t1, $t0, 1 #Va a ser un desplazamiento que siempre va adelante de $t0
	lbu $t2 array($t0)
	beqz $t2 finBucle1
	bucle2:
		lbu $t2 array($t0)
		lbu $t3 array($t1)
		beqz $t3 finBucle2
		ble $t2, $t3 saltarmeIntercambio #Se asemeja al funcionamiento de un if
		sb $t2 array($t1)
		sb $t3 array($t0)	
	saltarmeIntercambio:
	addi $t1, $t1, 1
	b bucle2
	finBucle2:
	
addi $t0, $t0, 1
ble $t0 8 bucle1
finBucle1:
li $t0 0
#Imprimir el string
li $v0 4
la $a0 array
syscall 
li $v0 10
syscall