    .text               	# Comienza secci�n de c�digo
    .globl start        	# S�mbolo exportado para que sea conocido globalmente

start:
	li	$s0, 0 				# i = 0
	li	$s1, 51				# max = 51
	lw	$t0, sumatorio		# suma = 0

loop:
	addi $s0, $s0, 1		# i = i + 1
	beq $s0, $s1, end		# cuando i > max, termina
	
	div $s3, $s0, 2			# i / 2 (para ver si es par).
	mfhi $t1				# Se guarda el resto de la divisi�n.
	beq $t1, 1, suma	# Si el resto es 1 (impar), lo suma.
	
	j	loop				# Vuelta al bucle.
	
suma:
	add	$t0, $t0, $s0		# sum = sum + i
	sw $t0, sumatorio		# Se carga el nuevo valor del sumatorio.
	j	loop				# Vuelta al bucle.

end:	
	lw $a0, sumatorio		# Se carga el sumatorio para mostrarlo
   	li $v0, 1      			# Se carga el n�mero de llamada al sistema "print integer"
   	syscall					# Llamada al sistema

exit:	
	li   $v0, 10			# Se carga el n�mero de llamada al sistema para salir
  	syscall             	# Llamada al sistema

.data
	sumatorio: .word 0
