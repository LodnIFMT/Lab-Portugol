programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g

    funcao inicio()
    {
        g.iniciar_modo_grafico(verdadeiro)
        g.definir_dimensoes_janela(800, 600)

        inteiro tempoAnterior = u.tempo_decorrido()

        enquanto(verdadeiro) {
            g.limpar()

            // Desenhe seus gráficos aqui	funcao iniciarTela() {
		logico janela
		janela = verdadeiro
		g.iniciar_modo_grafico(janela)
		g.definir_dimensoes_janela(750, 375)

		real tamanho
		inteiro posY, janelaTempo
		posY = 376
		tamanho = 1.0
		
		
		enquanto (janela == verdadeiro) {
			g.definir_cor(g.COR_VERMELHO)
			g.limpar()
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto(55, posY, "Virando Um Programador")
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(tamanho)

			 // Controla o FPS
            	inteiro tempoAgora = u.tempo_decorrido()
            	enquanto(tempoAgora - tempoAnterior < 1000/10) {
                // Aguarda até que o tempo necessário para atingir o FPS desejado tenha passado
               tempoAgora = u.tempo_decorrido()
             	}
           	tempoAnterior = tempoAgora

         	   // Mostra o FPS na tela
               g.definir_cor(g.COR_BRANCO)
           	real fps = 1000.0/(tempoAgora - tempoAnterior)
            	g.desenhar_texto(10, 10, "FPS: ")
           	g.desenhar_texto(20, 20, "30")

            	g.renderizar()

           

        }
    }
}

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1230; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */