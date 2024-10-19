programa
{
	
	funcao inicio()
	{
		inteiro nivel, resultado
		escreva("Digite um Numero: ")
		leia(nivel)

		resultado = nivel % 10
		escreva("O Resultaso é: ", resultado)
		se (resultado < 1) {
			escreva("\nO Numero ", nivel, " É divisivel por 10")
		}
		senao {
			escreva("\nO Numero ", nivel, " Não é divisivel por 10")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 235; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */