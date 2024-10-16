	.text
	.globl start 

start:
	# Inicializaci�n de registros.
	la $t0, array			# $t0: array
	li $t1, 0				# $t1: cont = 0
    	
for: 
	# if (<cond>)
	lb   $a0, 0($t0)		# Carga el elemento actual del array.  
    beqz $a0, done			# Comprueba si el recorrido del array ha terminado.
 
	li $v0, 11	   			# "Print" del caracter actual (que est� cargado en $a0).
	syscall
	
	li $v0, 4       		# "Print" del Salto de l�nea 
	la $a0, newline       
	syscall

	add $t0, $t0, 1
    	add $t1, $t1, 1
    
	j     for

done:
	li $v0, 4       		# "Print" del texto. 
	la $a0, txt       
	syscall

	li $v0,1				# "Print" de "cont".
    add $a0, $0, $t1			
    syscall

exit:	
	li $v0, 10				# Carga el n�mero de llamada al sistema para salir
  	syscall             	# Llamada al sistema


# Inicializaci�n de los datos
.data
	array: 	.asciiz "Hola don Pepito, hola don Jos�"
	newline: .asciiz "\n"
	txt: .asciiz "El n�mero de caracteres de la frase es: "
