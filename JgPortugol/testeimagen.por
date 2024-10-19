programa
{
	inclua biblioteca Graficos --> g
	
	funcao inicio()
	{
		logico telaligada = verdadeiro
		inteiro esferaMaior = g.carregar_imagem("imagens/teste1.png")
		inteiro esferaMenor = g.carregar_imagem("imagens/teste2.png")

		g.iniciar_modo_grafico(telaligada)
		g.definir_dimensoes_janela(1200, 1200)
		
		enquanto (telaligada == verdadeiro) {
			g.definir_cor(0)
			g.desenhar_imagem(500, 500, esferaMaior)
			g.desenhar_imagem(500, 500, esferaMenor)
			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 161; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */