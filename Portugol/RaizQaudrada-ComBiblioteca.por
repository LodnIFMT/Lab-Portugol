programa
{
	inclua biblioteca Tipos --> t
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		inteiro numero
		real Raiz

		escreva("---RAIZ QUADRADA---","\n")
		escreva("Digite um Número: ")
		leia(numero)
	
		Raiz = Matematica.raiz(t.inteiro_para_real(numero), 2.0)
		escreva("\n","A raiz quandrada real mais próxima é ", Matematica.arredondar(Raiz, 2))
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 212; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */