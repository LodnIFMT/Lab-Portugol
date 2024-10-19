programa
{
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g

    	funcao inicio() {
        g.iniciar_modo_grafico(verdadeiro)
        g.definir_dimensoes_janela(1080, 720)

        inteiro tempoAnterior = u.tempo_decorrido()
        inteiro x,y
        x = 1080
        y = 210
        enquanto(verdadeiro) {
		g.limpar()
		g.definir_cor(g.COR_AZUL)
		g.desenhar_elipse(x, y, 80, 80, verdadeiro)
		se (x <= 1080) {
			x = x-1
		}
		se (x == -90) {
			x = 1070
		}

		// Controla o FPS
       	inteiro tempoAgora = u.tempo_decorrido()
          enquanto(tempoAgora - tempoAnterior < 1000/60) {
          // Aguarda até que o tempo necessário para atingir o FPS desejado tenha passado
          tempoAgora = u.tempo_decorrido()
          }
          tempoAnterior = tempoAgora
          g.renderizar()

   	 	}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 636; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */