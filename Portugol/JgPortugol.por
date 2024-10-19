programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Mouse --> m
	
	funcao inicio()
	{
		//iniciarTela()
		//u.aguarde(3000)
		IniciarJogo()
		escreva("Tudo Certo... Eu Acho")
	}

	funcao iniciarTela() {
		logico janela
		janela = verdadeiro
		g.iniciar_modo_grafico(janela)
		g.definir_dimensoes_janela(750, 375)

		real tamanho
		inteiro posY, janelaTempo
		janelaTempo = 4000
		posY = 376
		tamanho = 1.0
		
		
		enquanto (janela == verdadeiro) {
			janelaTempo = janelaTempo - 1
			g.definir_cor(g.COR_VERMELHO)
			g.limpar()
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_texto(55, posY, "Virando Um Programador")
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(tamanho)

			se (posY > 155) {
				posY = posY - 5
			}
			
			se (tamanho < 50.0) {
				tamanho = tamanho + 1.0
				u.aguarde(5)
			}

			se (janelaTempo == 0) {
				janela = falso
			}
			
			g.renderizar()
		}
	}

	funcao IniciarJogo() {
		logico jg
		inteiro telaLargura, telaAltura, posY, posX, rotacao, armposY, armposX, cena

		jg = verdadeiro
		telaAltura = 900
		telaLargura = 1500
		
		g.iniciar_modo_grafico(jg)
		g.definir_dimensoes_janela(telaLargura, telaAltura)

		posY = u.sorteia(0, telaLargura)
		posX = u.sorteia(0, telaAltura)
		armposX = posX
		armposY = posY
		rotacao = 0
		cena = 1
		enquanto (jg == verdadeiro) {
			g.definir_cor(g.COR_PRETO)
			g.limpar()

			se (rotacao > 360) {
				rotacao = 0
			} senao se (rotacao < 0) {
				rotacao = 360
			}

			se (t.tecla_pressionada(68)) {
				posY = posY++
				se (posY > telaLargura) {
					posY = 1
				}
			}

			se (t.tecla_pressionada(65)) {
				posY = posY--
				se (posY < -10) {
					posY = telaLargura - 1
				}
			}

			se (t.tecla_pressionada(83)) {
				posX = posX++
				se (posX > telaAltura) {
					posX = 0
				}
			}

			se (t.tecla_pressionada(87)) {
				posX = posX--
				se (posX < 0) {
					posX = telaAltura - 1
				}
			}

			se (t.tecla_pressionada(39)) {
				rotacao = rotacao++
			}

			se (t.tecla_pressionada(37)) {
				rotacao = rotacao--
			}
			
			personagem(posX, posY, rotacao, armposX, armposY)
			g.definir_rotacao(0)
			
			//OBJETOS PARA DESENHAR O CENARIO
			inteiro Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,Y10,Y11,Y12// Cordenadas Y
			inteiro X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12// Cordenadas X
			inteiro L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,L11,L12// Largura
			inteiro A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12// Altura
		
			se (cena == 1) {
				Y1 = 1
				Y2 = 100
				Y3 = 200
				Y4 = 310
				Y5 = 710
				Y6 = 910
				Y7 = 1200
				Y8 = 1300
				Y9 = 1490

				X1 = 1
				X2 = 100
				X3 = 310
				X4 = 410
				X5 = 600
				X6 = 620
				X7 = 690
				X8 = 790
				X9 = 800
				X10 = 890

				L1 = 10
				L2 = 50
				L3 = 100
				L4 = 200
				L5 = 1000

				A1 = 10
				A2 = 50
				A3 = 100
				A4 = 800
			
				cenario(Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9, X1,X2,X3,X4,X5,X6,X7,X8,X9,X10, L1,L2,L3,L4,L5, A1,A2,A3,A4)

				se (posX < X1 + 25 e posY > A1 e posY < L3) {
					posX = posX +1
				}
				se (posX < X1 + 25 e posY > Y3 - 50 e posY > A1 e posY < Y8 - 100) {
					posX = posX +1
				}
				se (posX < X1 + 25 e posY > Y8 - 50 e posY > A1 e posY < Y9) {
					posX = posX +1
				}

				se (posX > X10 - 45 e posY > A1 e posY < L3) {
					posX = posX -1
				}
				se (posX > X10 - 45 e posY > Y3 - 50 e posY > A1 e posY < Y8 - 100) {
					posX = posX -1
				}
				se (posX > X10 - 45 e posY > Y8 - 50 e posY > A1 e posY < Y9) {
					posX = posX -1
				}

			}
			
			g.renderizar()

			se (t.tecla_pressionada(27)) {
				jg = falso
			}
		}
	}

	funcao personagem(inteiro cpoY, inteiro cpoX, inteiro rot, inteiro armY, inteiro armX) {
		armY = cpoY - 15
		armX = cpoX + 15

		g.definir_rotacao(rot)
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(armX, armY, 30, 60, falso, verdadeiro)
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(cpoX, cpoY, 60, 30, falso, verdadeiro)
	}
	
	funcao cenario(
		inteiro y1,inteiro y2,inteiro y3, inteiro y4, inteiro y5, inteiro y6, inteiro y7, inteiro y8, inteiro y9,
		inteiro x1,inteiro x2,inteiro x3, inteiro x4, inteiro x5, inteiro x6, inteiro x7, inteiro x8, inteiro x9, inteiro x10,
		inteiro l1,inteiro l2,inteiro l3, inteiro l4, inteiro l5, inteiro a1, inteiro a2, inteiro a3, inteiro a4
		) {
		g.definir_cor(g.COR_VERDE)
		//´PAREDE SUPERIOR
		g.desenhar_retangulo(y1, x1, l3, a1, falso, verdadeiro)// parede cima esquerda (PAREDE: 1)
		g.desenhar_retangulo(y3, x1, l5, a1, falso, verdadeiro)// parede cima meio (PAREDE: 2)
		g.desenhar_retangulo(y8, x1, l4, a1, falso, verdadeiro)// parede sima esuqerda (PAREDE: 3)
		//PAREDE INFERIOR
		g.desenhar_retangulo(y1, x10, l3, a1, falso, verdadeiro)
		g.desenhar_retangulo(y3, x10, l5, a1, falso, verdadeiro)
		g.desenhar_retangulo(y8, x10, l4, a1, falso, verdadeiro)
		//PAREDE ESQUERDA
		g.desenhar_retangulo(y1, x1, l1, a4, falso, verdadeiro)
		//PAREDE DIREITA
		g.desenhar_retangulo(y9, x1, l1, a4, falso, verdadeiro)

		//QUADRADOS
		g.desenhar_retangulo(y5, x4, l2, a2, falso, verdadeiro)
		g.desenhar_retangulo(y4, x3, l2, a2, falso, verdadeiro)
		g.desenhar_retangulo(y6, x6, l2, a2, falso, verdadeiro)
		//PONTO A (L SUPERIOR ESQUERDO)
		g.desenhar_retangulo(y2, x2, l1, a3, falso, verdadeiro)
		g.desenhar_retangulo(y2, x2, l3, a1, falso, verdadeiro)
		//PONTO B (L SUPERIOR DIREITO)
		g.desenhar_retangulo(y8, x2, l1, a3, falso, verdadeiro)
		g.desenhar_retangulo(y7, x2, l3, a1, falso, verdadeiro)
		//PONTO C (L INFERIOR)
		g.desenhar_retangulo(y7, x7, l3, a1, falso, verdadeiro)
		g.desenhar_retangulo(y8, x5, l1, a3, falso, verdadeiro)
		//COVER`S INFERIORES
		g.desenhar_retangulo(y8, x8, l1, a3, falso, verdadeiro)// DIREITO
		g.desenhar_retangulo(y2, x9, l1, a3, falso, verdadeiro)//  ESQUERDO
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2977; 
 * @DOBRAMENTO-CODIGO = [15];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */