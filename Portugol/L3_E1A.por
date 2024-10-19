//ler uma temperatura em graus Celsius e apresentá-lo convertido em Fahrenheit
programa
{
	
	funcao inicio()
	{
		escreva("---------- Grau Celsius convertido para Fahrenheit ----------\n\n")
		
		//ler uma temperatura em graus Celsius
		inteiro gc

		escreva("Graus Celsius :")
		leia(gc)
		
		//e apresentá-lo convertido em Fahrenheit
		escreva("Fórmula: (", gc, "°C x 9/5) + 32 = ", (gc * 9/5) + 32, "°F\n")
		escreva("RESULTADO: ", (gc * 9/5) + 32, "°F")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 193; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */