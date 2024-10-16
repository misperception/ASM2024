	.text
	.globl start 

start:
	# Inicializaci�n de registros.
	la $s0, size 			# $s1 = size		
	lw $s1, 0($s0)  		
	ori $t0, $0, 0 			# $t0 = cont
	ori $s2, $0, 0 			# $s2 = sum
	ori $s3, $0, 0 			# $s3 = pos
	ori $s4, $0, 0 			# $s4 = neg

	# <init>
	ori $s5, $0, 0 			# $s5 = i
	la $s6, array 			# $s6 = &array
	
for: 
	# if (<cond>)
	bge $s5, $s1, done		# Condición de finalización del for/while (que i>=size)

	# <for-body>
	lw $s7, 0($s6) 			# $s7 = *$s6 (array[i])
	add $s2, $s2, $s7 		# sum += $s7
	add $t0, $t0, 1			# cont++
	blez $s7, negativos		# Actualizar sumatorio de números negativos
	add $s3, $s3, $s7 		# pos += $s7
	j update 				# *código del for/while continúa en update*

negativos: 
	bgez $s7, update 		# No sumar si $s7==0 (línea redundante, se sumaría 0 sin ella y el resultado es el mismo.)
	add $s4, $s4, $s7 		# neg += $s7

update: 
	# <update>
	addi $s5, $s5, 1 		# i++
	addi $s6, $s6, 4 		# Mover puntero del array
	j for 					# Repetición del bucle

done:
	move   $a0, $t0   		# Imprimir contador de elementos (debería imprimir 15)
   	li   $v0, 1      	    
   	syscall					
	
	li $v0, 4       		# Imprimir \n
	la $a0, newline       
	syscall
	
	move   $a0, $s2   		# Imprimir suma de elementos del array
   	li   $v0, 1      	    
   	syscall					

	li $v0, 4       		# Imprimir \n
	la $a0, newline       
	syscall

	move   $a0, $s3   		# Imprimir suma de elementos positivos del array
   	li   $v0, 1      	
   	syscall				
	
	li $v0, 4       		# Imprimir \n
	la $a0, newline       
	syscall
	
	move   $a0, $s4   		# Imprimir suma de elementos negativos del array
   	li   $v0, 1      	
   	syscall				

exit:						# return;
	li   $v0, 10		
  	syscall             

# Inicializaci�n de los datos
.data
	size: 	.word 15		# Longitud del array
	array: 	.word 7, 3, 1, -25, 99, 54, 7, 9, -25, -123, 98, 56, 0, 34, -39 # Elementos del array
	newline: .asciiz "\n"