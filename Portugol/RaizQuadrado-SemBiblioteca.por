programa
{
	inclua biblioteca Tipos --> t
	
	funcao inicio()
	{
		inteiro numero, divisor = 1
		real Raiz, raiz = 0.0, resultado = 1.0

		escreva("---RAIZ QUADRADA---","\n")
		escreva("Digite um Número: ")
		leia(numero)

		enquanto (resultado < numero) {
			resultado = resultado*2
			se (resultado < numero) {
				divisor++
				raiz = t.inteiro_para_real(numero)/ divisor
				escreva("\n", raiz, "\n")
			}
		}

		escreva("A raiz quandrada mais próxima é ", raiz)
	}
}









/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 41; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */