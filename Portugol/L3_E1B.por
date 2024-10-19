// ler uma temperatura em graus Fahrenheit e apresentá-lo convertido em Celsius.
programa
{
	
	funcao inicio()
	{
		escreva("---------- Fahrenheit convertido para Grau Celsius ----------\n\n")
		
		// ler uma temperatura em graus Fahrenheit...
		inteiro f
		
		escreva("Grau Fahrenheit :")
		leia(f)
		
		// e apresentá-lo convertido em Celsius.
		escreva("Formula: (", f, "°F - 32) x 5/9 = ", (f-32) * 5/9, "°C\n")
		escreva("RESULTADO: ", (f-32) * 5/9, "°C")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 195; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */