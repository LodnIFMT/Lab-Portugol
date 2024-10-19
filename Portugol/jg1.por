programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t
	inclua biblioteca Mouse --> m
	
	funcao inicio()
	{
		AbrirJanela()
		escreva("teste")
	}

	funcao AbrirJanela() {
		logico janela

		janela = verdadeiro

		g.iniciar_modo_grafico(janela)
		g.definir_dimensoes_janela(1200, 800)
		enquanto (janela == verdadeiro) {
			g.definir_cor(g.COR_PRETO)
			g.limpar()
			cover()
			g.renderizar()

			se (t.tecla_pressionada(t.TECLA_F11)) {
				g.entrar_modo_tela_cheia()

				se (t.tecla_pressionada(t.TECLA_F11)) {
					g.sair_modo_tela_cheia()
				}
			}
			
			se (t.tecla_pressionada(t.TECLA_ESC)) {
				janela = falso
			}
		}
	}

	funcao cover() {
		inteiro dsy, dsx, diy, dix

		dsy = g.altura_janela()
		dsy = dsy - 350
		dsx = g.altura_janela()
		
		g.definir_cor(g.COR_VERDE)
		//esquerdo superior
		g.desenhar_retangulo(250, 120, 50, 10, falso, verdadeiro)
		g.desenhar_retangulo(250, 120, 10, 50, falso, verdadeiro)

		//direita superio
		dsy = 950
		dsx = 120
		g.desenhar_retangulo(950, 120, 50, 10, falso, verdadeiro)
		g.desenhar_retangulo(990, 120, 10, 50, falso, verdadeiro)

		//esquerdo inferior
		g.desenhar_retangulo(250, 680, 50, 10, falso, verdadeiro)
		g.desenhar_retangulo(250, 640, 10, 50, falso, verdadeiro)
		
		//direito inferior
		g.desenhar_retangulo(950, 680, 50, 10, falso, verdadeiro)
		g.desenhar_retangulo(990, 640, 10, 50, falso, verdadeiro)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 773; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */