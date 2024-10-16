    .text               	# Comienza secci�n de c�digo
    .globl start        	# S�mbolo exportado para que sea conocido globalmente

start:
	li	$s0, 0 				# i = 0
	li	$s1, 51				# max = 51
	lw	$t0, cuentapar		# cuentapar = 0
	lw	$t1, cuentaimpar	# cuentaimpar = 0

loop:
	addi $s0, $s0, 1		# i = i + 1
	beq $s0, $s1, end		# cuando i > max, termina
	
	div $s3, $s0, 2			# i / 2 (para ver si es par).
	mfhi $t2				# Se guarda el resto de la divisi�n.
	beq $t2, 0, par	# Si el resto es 0 (par), salta a par
	
impar: 
	add 	$t1, $t1, 1	# cuentaimpar = cuentaimpar +1
	sw	$t1, cuentaimpar	# Se carga el nuevo valor de cuentaimpar
	j	loop		# Vuelve al bucle
	
par:
	add	$t0, $t0, 1	# cuentapar = cuentapar + 1
	sw 	$t0, cuentapar		# Se carga el nuevo valor de cuentapar.
	j	loop		# Vuelve al bucle

end:	
	lw $a0, cuentapar		# Se carga el valor de la cuenta par para mostrarlo
   	li $v0, 1      			# Se carga el n�mero de llamada al sistema "print integer"
   	syscall					# Llamada al sistema
   	
   	lw $a0, salto
   	li $v0, 11
   	syscall

   	lw $a0, cuentaimpar		# Se carga el valor de la cuenta impar para mostrarlo
   	li $v0, 1      			# Se carga el n�mero de llamada al sistema "print integer"
   	syscall					# Llamada al sistema

exit:	
	li   $v0, 10			# Se carga el n�mero de llamada al sistema para salir
  	syscall             		# Llamada al sistema

.data
	cuentapar: .word 0
	cuentaimpar: .word 0
	salto: .asciiz "\n"