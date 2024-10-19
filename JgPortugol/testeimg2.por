programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g
	
	funcao inicio()
	{
		logico telaligada = verdadeiro
		inteiro imagen = 0

		g.iniciar_modo_grafico(telaligada)
		g.definir_dimensoes_janela(1200, 1200)
		
		enquanto (telaligada == verdadeiro) {
			imagen = 0
			g.definir_cor(0)
			imagen = img(imagen)
			g.renderizar()
			g.liberar_imagem(imagen)
			u.aguarde(100)
		}
	}

	funcao inteiro img(inteiro imagen) {
			imagen = g.carregar_imagem("imagens/Icone_Marina_V19.png")
			//imagen = g.carregar_imagem("imagens/Esfera_Magica_25X25.png")
			g.desenhar_imagem(15, 520, imagen)
			retorne imagen
		}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 395; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */