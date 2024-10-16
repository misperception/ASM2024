    .text          		# Comienza secci�n de c�digo
    .globl start    	# S�mbolo exportado para que sea conocido globalmente

start:  
	li $s0, 0x8			# Carga el valor 8 - base
	li $s1, 0x5			# Carga el valor 5 - altura
	mul $s2, $s0, $s1	# Multiplica y almacena el resultado en $s2 - �rea rect�ngulo
	div $s2, $s2, 2		# Divide $s2 entre 2
	
	move $a0, $s2   	# Se carga el area para mostrarlo
   	li $v0, 1      		# Se carga el n�mero de llamada al sistema "print integer"
   	syscall				# Llamada al sistema
exit:
	
	li   $v0, 10		# Se carga el n�mero de llamada al sistema para salir
  	syscall             # Llamada al sistema
