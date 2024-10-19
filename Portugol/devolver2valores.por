programa
{
	funcao inicio()
	{
		inteiro valor1, valor2
		inteiro valores[2] = {0, 0}
		
		escreva("Digite um Valor: ")
		leia(valor1)
		escreva("Digite um Valor: ")
		leia(valor2)
		
		para (inteiro i = 0;i < 2; i++) {
			valores[i] = soma(valor1, valor2, i)
		}

		escreva(valores[0])
		escreva(valores[1])
	}

	funcao inteiro soma(inteiro valor1, inteiro valor2, inteiro retorno) {
		valor1++
		valor2++

		se (retorno == 0) {
			retorne valor1
		} senao {
			retorne valor2
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 308; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */