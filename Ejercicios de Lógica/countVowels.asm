.data
saludo:	.asciiz "El número de vocales es: "
texto:	.asciiz "JOSELEONARDOHURTADOVITORA"
tabla:	.asciiz 
	.space 65, 
	.byte 1,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0
	.space 165
.text
	li   $t0 0 #Registro que apunta a texto
	li   $t2,0 #Contador de vocales
lazo1:	lb   $t1, texto($t0) #Registro que contiene el equivalente numérico de la letra
	beqz $t1, siga
	lb   $t3,tabla($t1)#Trae un 0 o un 1 de la tabla
	add  $t2, $t2,$t3
	addi $t0,$t0,1
	b lazo1

siga:	la $a0,saludo
	li $v0,4
	syscall
	move $a0,$t2
	li $v0,1
	syscall
	
	
	#Cerrar programa
	li   $v0,10
	syscall

	
	