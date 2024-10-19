programa
{
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		inteiro tabuleiro_motor[3][3], comeca
		cadeia jogadores[2], tabuleiro[3][3]
		logico FimJG = falso

		para (inteiro l = 0; l < 3; l++) {
			para (inteiro c = 0; c < 3; c++) {
				tabuleiro_motor[l][c] = 0
			}
		}

		para (inteiro l = 0; l < 3; l++) {
			para (inteiro c = 0; c < 3; c++) {
				tabuleiro[l][c] = "-"
			}
		}
		
		escreva("O --- JOGO DA VELHA --- X")
		
		para (inteiro j = 0; j < 2; j++) {
			escreva("\nJogador ",j+1)
			escreva("\nDigite o seu Apelido: ")
			leia(jogadores[j])
			inteiro Cont_Caracter = t.numero_caracteres(jogadores[j])
			se (Cont_Caracter > 10) {
				escreva("!!!O APELIDO DIGITADO ULTRAPASSOU O LIMITE DE CARACTERES!!!")
				escreva("\nLimite Maximo de Caracteres é 10")
				escreva("\nO Apelido ", jogadores[j], "contem ", Cont_Caracter, " caracteres")
				escreva("Digite novamente...")
				u.aguarde(3000)
				j--
			}
			limpa()
		}
		
		comeca = u.sorteia(1, 2)

		enquanto (FimJG == falso) {
			inteiro linha = -1, coluna = -1, resposta = 1
			logico Confirmacao = falso
			limpa()
			escreva("( ----- ) JOGO DA VELHA > ----- <")
			escreva("\nO - ",jogadores[0], "  VS  ", jogadores[1], " - X")
			para (inteiro l = 0; l < 3; l++) {
				escreva("\n","\n           ", l+1)
				para (inteiro c = 0; c < 3; c++) {
					escreva("  ",tabuleiro[l][c])
				}
			}
			se (comeca == 1) {
				enquanto (Confirmacao == falso) {
					escreva("\n",jogadores[0]," É SUA VEZ")
					escreva("\nLinha:   ")
					leia(linha)
					escreva("\nColuna:  ")
					leia(coluna)

					escreva("\n1 - Sim")
					escreva("\n2 - Não")
					escreva("\n!! VOCÊ COFIRMA A RESPOSTA? ")
					leia(resposta)
					se (resposta == 1  e tabuleiro_motor[linha][coluna] == 0 e linha > 0 e linha <= 3 e coluna > 0 e coluna <= 3) {
						Confirmacao = verdadeiro
						tabuleiro_motor[linha - 1][coluna - 1] = 2
					} senao se (resposta == 2) {
						Confirmacao = falso
						escreva("RESPOSTA CANCELADA!!")
					} senao {
						escreva("RESPOSTA INVALIDA!!")
						se (tabuleiro_motor[linha][coluna] == 0) {
							escreva("essa posiçã ja está ocupada!!")
						}
					}
				}
			} senao {
				enquanto (Confirmacao == falso) {
					escreva("\n",jogadores[1]," É SUA VEZ")
					escreva("\nLinha:   ")
					leia(linha)
					escreva("\nColuna:  ")
					leia(coluna)

					escreva("\n1 - Sim")
					escreva("\n2 - Não")
					escreva("\n!! VOCÊ COFIRMA A RESPOSTA? ")
					leia(resposta)
					se (resposta == 1 e tabuleiro_motor[linha][coluna] == 0 e linha > 0 e linha < 3 e coluna > 0 e coluna < 3) {
						Confirmacao = verdadeiro
						tabuleiro_motor[linha - 1][coluna - 1] = 2
					} senao se (resposta == 2) {
						Confirmacao = falso
						escreva("RESPOSTA CANCELADA!!")
					} senao {
						escreva("RESPOSTA INVALIDA!!")
						se (tabuleiro_motor[linha][coluna] == 0) {
							escreva("essa posiçã ja está ocupada!!")
						}
					}
				}
			}
			

			se (comeca == 1) {
				comeca++
			} senao {
				comeca--
			}

			//FimJG = verdadeiro
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2600; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {tabuleiro_motor, 8, 10, 15}-{comeca, 8, 33, 6}-{tabuleiro, 9, 23, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */