    .text
    .globl start

start:
    la $a0, msg1    # Imprimir primer mensaje
    li $v0, 4
    syscall
    
    li $v0, 5       # Leer primera nota
    syscall
    move $t0, $v0	# Cargar nota en $t0

    la $a0, msg2    # Imprimir segundo mensaje
    li $v0, 4
    syscall
    
    li $v0, 5       # Leer segunda nota
    syscall
    move $t1, $v0	# Cargar nota en $t1

    la $a0, msg3    # Imprimir tercer mensaje
    li $v0, 4
    syscall

    li $v0, 5       # Leer tercera nota
    syscall
    move $t2, $v0	# Cargar nota en $t2

calc:
    add $a1, $t0, $t1   # Sumar las tres notas
    add $a1, $a1, $t2
    div $a1, $a1, 3     # Dividir la suma de las notas
    bge $a1, 5, pass    # Si media>=5, ir a pass 

fail:
    la $a0, suspenso    # Imprimir "Suspenso"
    li $v0, 4
    syscall
    j end               # Finalizar

pass:
    la $a0, aprobado    # Imprimir "Aprobado"
    li $v0, 4
    syscall

end:
    li $v0, 10          # Imprimir codigo de salida
    syscall

.data
    msg1: .asciiz "Introduce la primera nota:\t"
    msg2: .asciiz "Introduce la segunda nota:\t"
    msg3: .asciiz "Introduce la tercera nota:\t"
    aprobado: .asciiz "Aprobado"
    suspenso: .asciiz "Suspenso"