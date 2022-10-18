# Programa para calcular o Histograma do vetor V
# Coloque aqui seu NOME COMPLETO e MATRÍCULA
# Nome: André Eduardo Meneses do Nascimento
# Matrícula: 20210039150

.data

  # Quantidade de intensidades analisadas no vetor V
  Lmax: .word 10

  # Tamanho máximo do vetor V
  TAM: .word 35
  
  # Garantindo que a leitura da memória deve estar alinhada para words de 4 bytes
  # (a leitura ou escrita da memória será feita tomando 2^2 endereços de uma só vez)
  .align 2
 
  # Vetor com as 36 amostras
  V: .word 9, 5, 7, 5, 3, 4, 0, 2, 6, 4, 2, 5, 4, 1, 2, 1, 6, 2, 2, 3, 6, 3, 0, 0, 7, 8, 3, 4, 5, 4, 0, 5, 2, 9, 8, 7
  
  # Espaço alocado para o vetor H (são 10 elementos de 4 bytes, cada)
  H: .space 40

  # Vetor de contadores
  H: .word 0 0 0 0 0 0 0 0 0 0
  
 
.text

  main:
    li $t1, 0
    li $t2, 0
    la $s1, V   #Endereço do vetor
    la $s2, H   #Endereço do vetor de contadores

  loop:
    lw $t2, 0($s1) 

    multi $t3, $t2, 4  
    add $t4, $s2, $t3

    lw $t5, 0($t4)
    addi $t5, $t5, 1
    sw $t5, 0($t4) 

    sll $s1, $s1, 2
    addi $t1, $t1, 1

    bne $t1, TAM, loop
  
  # Final do programa
  # Chamada do sistema para finalizar (não pode ser modificado)
  addi $v0, $zero, 10
  syscall
