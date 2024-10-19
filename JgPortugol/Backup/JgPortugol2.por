programa
{
	inclua biblioteca Tipos --> tp
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
		logico jg, SpawnDeEsferas, idev, andando	
		inteiro telaLargura, telaAltura, posY, posX, VelDoPerssonagem, cena, esferas, nivel, EsferasColetadas, EFormacao,
			   vd, FSBonus, FaseB, passos, ganhou, perdeu
		
		logico Esfera[5] = {
			verdadeiro, verdadeiro, verdadeiro, verdadeiro, verdadeiro
		}
		logico ed[5] = {
			verdadeiro, verdadeiro, verdadeiro, falso, falso
		}
		logico ec[5] = {
			falso, falso, falso, falso, falso
		}
		logico edc[5] = {
			falso, falso, falso, falso, falso
		}

		inteiro tempoAnterior = u.tempo_decorrido()

		jg = verdadeiro
		telaAltura = 900
		telaLargura = 1500
		
		g.iniciar_modo_grafico(jg)
		g.definir_dimensoes_janela(telaLargura, telaAltura)

		posY = u.sorteia(0, telaLargura)
		posX = u.sorteia(0, telaAltura)
		
		idev = falso
		cena = 1
		esferas = 5
		nivel = 1
		EsferasColetadas = 0
		VelDoPerssonagem = 3
		SpawnDeEsferas = verdadeiro
		EFormacao = 1
		FSBonus = 0
		FaseB = 1
		passos = 0
		andando = falso
		vd = 150
		ganhou = 25
		perdeu = 50
		
		enquanto (jg == verdadeiro) {
			g.definir_cor(g.COR_PRETO)
			g.limpar()
		
			se (cena == 1) {
				se (nivel > 9 e nivel % 10 < 1) {
					infoDev(posY, posX)
					bonus()

					
				} senao {
					
					se (nivel <= 5) {
						cenario(verdadeiro, falso, falso, falso, falso)
						//QUADRADO CENTRAL
						//ESQUERDO <--
						se (posY >= 645 e posY <= 747 e posX >= 345 e posX <= 385) {
							posX = posX - VelDoPerssonagem
						}
						//DIREITO -->
						se (posY >= 645 e posY <= 747 e posX >= 386 e posX <= 450) {
							posX = posX + VelDoPerssonagem
						}
						//CIMA
						se (posY >= 642 e posY <= 644 e posX >= 345 e posX <= 450) {
							posY = posY - VelDoPerssonagem
						}
						//BAIXO
						se (posY >= 748 e posY <= 750 e posX >= 345 e posX <= 450) {
							posY = posY + VelDoPerssonagem
						}
					} senao se (nivel >= 6) {
						cenario(verdadeiro, verdadeiro, falso, falso, falso)
						//L4
						//CIMA
						se (posY >= 105 e posX >= 645 e posY <= 200 e posX <= 650) {
							posX = posX - VelDoPerssonagem
						}
						//BAIXO
						se (posY >= 40 e posX >= 651 e posY <= 200 e posX <= 710) {
							posX = posX + VelDoPerssonagem
						}
						//ESQUERDO <--
						se (posY >= 41 e posX >= 554 e posY <= 45 e posX <= 709) {
							posY = posY - VelDoPerssonagem
						}
						//DIREITO -->
						se (posY >= 46 e posX >= 554 e posY <= 110 e posX <= 655) {
							posY = posY + VelDoPerssonagem
						}

						//QUADRADO CENTRAL
						//ESQUERDO <--
						se (posY >= 641 e posY <= 643 e posX >= 345 e posX <= 450) {
							posY = posY - VelDoPerssonagem
						}
						//DIREITO -->
						se (posY >= 798 e posY <= 800 e posX >= 343 e posX <= 450) {
							posY = posY + VelDoPerssonagem
						}
						//CIMA
						se (posY >= 644 e posY <= 797 e posX >= 401 e posX <= 450) {
							posX = posX + VelDoPerssonagem
						}
						//BAIXO
						se (posY >= 644 e posY <= 797 e posX >= 345 e posX <= 400) {
							posX = posX - VelDoPerssonagem
						}
					
					}
					se (nivel >= 8) {
						cenario(verdadeiro, verdadeiro, verdadeiro, falso, falso)

						//L1 CIMA
						//CIMA
						se (posY >= 245 e posY <= 409 e posX >= 45 e posX <= 47) {
							posX = posX - VelDoPerssonagem
						}
						//BAIXO
						se (posY >= 245 e posY <= 405 e posX >= 108 e posX <= 110) {
							posX = posX + VelDoPerssonagem
						}
						//PONTA ESQUERDA
						se (posY >= 241 e posY <= 244 e posX >= 48 e posX <= 109) {
							posY = posY - VelDoPerssonagem
						}
						//DIRETA -->
						se (posY >= 404 e posY <= 409 e posX >= 44 e posX <= 198) {
							posY = posY + VelDoPerssonagem
						}
						//ESQUERDA <--
						se (posY >= 341 e posY <= 343 e posX >= 110 e posX <= 198) {
							posY = posY - VelDoPerssonagem
						}
						//PONTA BAIXO
						se (posY >= 344 e posY <= 408 e posX >= 199 e posX <= 200) {
							posX = posX + VelDoPerssonagem
						}

						//L2 BAIXO
						//CIMA
						se (posY >= 245 e posY <= 409 e posX >= 643 e posX <= 645) {
							posX = posX - VelDoPerssonagem
						}
						//BAIXO
						se (posY >= 245 e posY <= 405 e posX >= 707 e posX <= 709) {
							posX = posX + VelDoPerssonagem
						}
						//PONTA ESQUERDA
						se (posY >= 241 e posY <= 244 e posX >= 645 e posX <= 710) {
							posY = posY - VelDoPerssonagem
						}
						//DIRETA -->
						se (posY >= 404 e posY <= 409 e posX >= 559 e posX <= 710) {
							posY = posY + VelDoPerssonagem
						}
						//ESQUERDA <--
						se (posY >= 341 e posY <= 343 e posX >= 559 e posX <= 705) {
							posY = posY - VelDoPerssonagem
						}
						//PONTA CIMA
						se (posY >= 344 e posY <= 408 e posX >= 555 e posX <= 558) {
							posX = posX - VelDoPerssonagem
						}
					}
					se (nivel >= 9) {
						cenario(verdadeiro, verdadeiro, verdadeiro, verdadeiro, falso)

						//AGUA
						se (posY >= 56 e posX >= 56 e posY <= 400 e posX <= 699) {
							VelDoPerssonagem = 1
						}
						senao {
							VelDoPerssonagem = 3
						}
					}
					se (nivel >= 11) {
						cenario(verdadeiro, verdadeiro, verdadeiro, verdadeiro, verdadeiro)

						//AGUA
						se (posY >= 56 e posX >= 56 e posY <= 400 e posX <= 699) {
							VelDoPerssonagem = 1
						}
						senao se (posY >= 943 e posX >= 53 e posY <= 1299 e posX <= 305) {
							VelDoPerssonagem = 1
						}
						senao {
							VelDoPerssonagem = 3
						}

						//CASA
						//PAREDE ESQUERDA
						//FORA
						se (posY >= 540 e posY <= 548 e posX >= 217 e posX <= 511) {
							posY = posY - VelDoPerssonagem
						}
						//DENTRO
						se (posY >= 608 e posY <= 610 e posX >= 225 e posX <= 511) {
							posY = posY + VelDoPerssonagem
						}
						//PONTA
						se (posY >= 540 e posY <= 610 e posX >= 512 e posX <= 515) {
							posX = posX + VelDoPerssonagem
						}
						//PAREDE CIMA
						//FORA
						se (posY >= 549 e posY <= 900 e posX >= 214 e posX <= 216) {
							posX = posX - VelDoPerssonagem
						}
						//DENTRO
						se (posY >= 607 e posY <= 900 e posX >= 275 e posX <= 280) {
							posX = posX + VelDoPerssonagem
						}
						//PAREDE DIREITA
						//DENTRO
						se (posY >= 832 e posY <= 835 e posX >= 275 e posX <= 512) {
							posY = posY - VelDoPerssonagem
						}
						//FORA
						se (posY >= 893 e posY <= 900 e posX >= 215 e posX <= 513) {
							posY = posY + VelDoPerssonagem
						}
						//PAREDE BAIXO
						//DENTRO
						se (posY >= 642 e posY <= 895 e posX >= 454 e posX <= 456) {
							posX = posX - VelDoPerssonagem
						}
						//FORA
						se (posY >= 642 e posY <= 900 e posX >= 518 e posX <= 520) {
							posX = posX + VelDoPerssonagem
						}
						//PAREDE MEIO
						//LADO ESQUERDO
						se (posY >= 642 e posY <= 645 e posX >= 297 e posX <= 517) {
							posY = posY - VelDoPerssonagem
						}
						//LADO DIREITO
						se (posY >= 708 e posY <= 710 e posX >= 295 e posX <= 517) {
							posY = posY + VelDoPerssonagem
						}
						//PONTA
						se (posY >= 642 e posY <= 710 e posX >= 294 e posX <= 296) {
							posX = posX - VelDoPerssonagem
						}

						//COVER´S INFERIORES
						//COVER ESQUERDO:
						//LADO ESQUERDO <--
						se (posY >= 141 e posY <= 145 e posX >= 746 e posX <= 900) {
							posY = posY - VelDoPerssonagem
						}
						//LADO DIREITO -->
						se (posY >= 205 e posY <= 210 e posX >= 746 e posX <= 900) {
							posY = posY + VelDoPerssonagem
						}
							//PONTA
						se (posY >= 141 e posY <= 210 e posX >= 743 e posX <= 745) {
							posX = posX - VelDoPerssonagem
						}

						//COVER DIREITO
						//LADO ESQUERDO <--
						se (posY >= 1140 e posY <= 1145 e posX >= 746 e posX <= 900) {
							posY = posY - VelDoPerssonagem
						}
						//LADO DIREITO -->
						se (posY >= 1205 e posY <= 1210 e posX >= 746 e posX <= 900) {
							posY = posY + VelDoPerssonagem
						}
						//PONTA
						se (posY >= 1140 e posY <= 1210 e posX >= 743 e posX <= 745) {
							posX = posX - VelDoPerssonagem
						}
					}
					infoDev(posX, posY)
				}
				//PERSSONAGEM
				se (vd > 0) {
					se (vd >100) {
						VelDoPerssonagem = 4
					}
				//Andar para Direita
					se (t.tecla_pressionada(68)) {
						posY = posY + VelDoPerssonagem
						passos++
						se (posY > telaLargura) {
							posY = -58
						}
					}
				//Andar para Esquerda
					se (t.tecla_pressionada(65)) {
						posY = posY - VelDoPerssonagem
						passos++
						se (posY < -58) {
							posY = telaLargura - 1
						}
					}
				//Andar para Baixo
					se (t.tecla_pressionada(83)) {
						posX = posX + VelDoPerssonagem
						passos++
						se (posX > telaAltura) {
							posX = -56
						}
					}
				//Andar para Cima
					se (t.tecla_pressionada(87)) {
						posX = posX - VelDoPerssonagem
						passos++
						se (posX < -56) {
							posX = telaAltura - 1
						}
					}
				} senao {
					VelDoPerssonagem = 0
					gameover()
				}
				
				se (t.tecla_pressionada(65) ou t.tecla_pressionada(68) ou t.tecla_pressionada(83) ou t.tecla_pressionada(87)) {
					se (passos > 5) {
						vd--
						passos = 0
					}
				}
				
				vd = personagem(posX, posY, passos, vd, andando)

				se (nivel % 10 != 0) {
					se (posX < 10 e posY > 9 e posY < 100) {
						posX = posX + VelDoPerssonagem
					}
					senao se (posX < 10 e posY > 150 e posY > 9 e posY < 1200) {
						posX = posX + VelDoPerssonagem
					}
					senao se (posX < 10 e posY > 1250 e posY > 9 e posY < 1500) {
						se (t.tecla_pressionada(68) e t.tecla_pressionada(87)) {
							posY = posY - VelDoPerssonagem
							posX = posX + VelDoPerssonagem
						}
						posX = posX + VelDoPerssonagem
					}

					senao se (posX > 834 e posY > -10 e posY < 100) {
						posX = posX - VelDoPerssonagem
					}
					senao se (posX > 834 e posY > 150 e posY > 10 e posY < 1200) {
						posX = posX - VelDoPerssonagem
					}
					senao se (posX > 834 e posY > 1250 e posY > 10 e posY < 1490) {
						posX = posX - VelDoPerssonagem
					}

					senao se (posY < 11 e posX > 1 e posX < 800) {
						se (t.tecla_pressionada(65) e t.tecla_pressionada(87)) {
							posY = posY + VelDoPerssonagem
							posX = posX + VelDoPerssonagem
						}
						posY = posY + VelDoPerssonagem
					}

					senao se (posY > 1430 e posX > 1 e posX < 800) {
						posY = posY - VelDoPerssonagem
					}


					//L1
					//CIMA
					se (posX >= 44 e posY >= 40 e posX < 75 e posY < 200) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posX <= 110 e posY <= 200 e posX >= 76 e posY >= 50) {
						posX = posX + VelDoPerssonagem
					}
					//ESQUERDA <-
					se (posY >= 40 e posX >= 70 e posY <= 107 e posX < 200) {
						posY = posY - VelDoPerssonagem
					}
					//DIREITA ->
					se (posY <= 110 e posX < 203 e posY > 41 e posX > 100) {
						posY = posY + VelDoPerssonagem
					}
					se (posY <= 110 e posX < 203 e posY > 41 e posX > 100) {
						posY = posY + VelDoPerssonagem
					}

					//L1
					//CIMA
					se (posX >= 44 e posY >= 40 e posX < 75 e posY < 200) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posX <= 110 e posY <= 200 e posX >= 76 e posY >= 50) {
						posX = posX + VelDoPerssonagem
					}
					//ESQUERDA <-
				
					se (posY >= 40 e posX >= 70 e posY <= 107 e posX < 200) {
						posY = posY - VelDoPerssonagem
					}
					//DIREITA ->
					se (posY <= 110 e posX < 203 e posY > 41 e posX > 100) {
						posY = posY + VelDoPerssonagem
					}
					se (posY <= 110 e posX < 203 e posY > 41 e posX > 100) {
						posY = posY + VelDoPerssonagem
					}

					//L2
					//CIMA
					se (posY >= 1140 e posX >= 44 e posY <= 1310 e posX <= 85) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posY >= 1140 e posX >= 86 e posY <= 1290 e posX <= 110) {
						posX = posX + VelDoPerssonagem
					}
					//ESQUERDO <--
					se (posY >= 1305 e posX >= 86 e posY <= 1310 e posX <= 200) {
						posY = posY + VelDoPerssonagem
					}
					//DIIREITO -->
					se (posY >= 1239 e posX >= 86 e posY <= 1309 e posX <= 200) {
						posY = posY - VelDoPerssonagem
					}

					//L3
					//CIMA
					se (posY >= 1140 e posX >= 634 e posY <= 1305 e posX <= 670) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posY >= 1140 e posX >= 665 e posY <= 1290 e posX <= 700) {
						posX = posX + VelDoPerssonagem
					}
					//ESQUERDO <--
					se (posY >= 1300 e posX >= 545 e posY <= 1309 e posX <= 700) {
						posY = posY + VelDoPerssonagem
					}
					//DIIREITO -->
					se (posY >= 1239 e posX >= 545 e posY <= 1309 e posX <= 695) {
						posY = posY - VelDoPerssonagem
					}
				
					//DIREITO -->
					se (posY >= 950 e posX >= 600 e posY <= 961 e posX <= 660) {
						posY = posY + VelDoPerssonagem
					}
					//ESQUERDO <--
					se (posY >= 850 e posX >= 600 e posY <= 880 e posX <= 660) {
						posY = posY - VelDoPerssonagem
					}
					//CIMA
					se (posY >= 850 e posX >= 565 e posY <= 951 e posX <= 640) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posY >= 850 e posX >= 590 e posY <= 951 e posX <= 670) {
						posX = posX + VelDoPerssonagem
					}

					//DIREITO -->
					se (posY >= 250 e posX >= 290 e posY <= 270 e posX <= 350) {
						posY = posY - VelDoPerssonagem
					}
					//ESQUERDO <--
					se (posY >= 300 e posX >= 290 e posY <= 360 e posX <= 350) {
						posY = posY + VelDoPerssonagem
					}
					//CIMA
					se (posY >= 250 e posX >= 254 e posY <= 360 e posX <= 310) {
						posX = posX - VelDoPerssonagem
					}
					//BAIXO
					se (posY >= 250 e posX >= 290 e posY <= 360 e posX <= 360) {
						posX = posX + VelDoPerssonagem
					}

					se (posY >= 40 e posX >= 743 e posY <= 50 e posX <= 900) {
						posY = posY - VelDoPerssonagem
					}
					se (posY >= 51 e posX >= 743 e posY <= 110 e posX <= 900) {
						posY = posY + VelDoPerssonagem
					}

					se (posY >= 1240 e posX >= 734 e posY <= 1250 e posX <= 900) {
						posY = posY - VelDoPerssonagem
					}
					se (posY >= 1251 e posX >= 734 e posY <= 1310 e posX <= 900) {
						posY = posY + VelDoPerssonagem
					}
				}
			}

			//Formação das Esferas
			se (EFormacao == 1) {
				se (posX >= 0 e posX <= 75 e posY >= 12 e posY <= 45) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 93 e posX <=  174 e posY >= 761 e posY <= 845) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 695 e posX <= 775 e posY >= 1391 e posY <= 1435) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 794 e posX <= 876 e posY >= 110 e posY <= 175) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 0 e posX <= 45 e posY >= 1175 e posY <= 1260) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}

				esferaDoDev(20, 50)
				se (Esfera[0] == verdadeiro ){
					esfera(20, 50)
				}
				esferaDoDev(820, 150)
				se (Esfera[1] == verdadeiro ){
					esfera(820, 150)
				}
				esferaDoDev(1450, 750)
				se (Esfera[2] == verdadeiro ){
					esfera(1450, 750)
				}
				esferaDoDev(150, 850)
				se (Esfera[3] == verdadeiro ){
					esfera(150, 850)
				}
				esferaDoDev(1235, 50)
				se (Esfera[4] == verdadeiro ){
					esfera(1235, 50)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}
			
			se (EFormacao == 2) {
				se (posX >= 10 e posX <= 75 e posY >= 591 e posY <= 675) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 94 e posX <= 176 e posY >= 360 e posY <= 440) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 695 e posX <= 775 e posY >= 665 e posY <= 750) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 795 e posX <= 840 e posY >= 1341 e posY <= 1425) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 5 e posX <= 74 e posY >= 192 e posY <= 274) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}
				
				esferaDoDev(650,50)
				se (Esfera[0] == verdadeiro) {
					esfera(650, 50)
				}
				esferaDoDev(420, 150)
				se (Esfera[1] == verdadeiro) {
					esfera(420, 150)
				}
				esferaDoDev(725, 750)
				se (Esfera[2] == verdadeiro) {
					esfera(725, 750)
				}
				esferaDoDev(1400, 850)
				se (Esfera[3] == verdadeiro) {
					esfera(1400, 850)
				}
				esferaDoDev(250, 50)
				se (Esfera[4] == verdadeiro) {
					esfera(250, 50)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}
			
			se (EFormacao == 3) {
				se (posX >= 110 e posX <= 164 e posY >= 110 e posY <= 164) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 70 e posX <= 150 e posY >= 1312 e posY <= 1395) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 594 e posX <= 640 e posY >= 1191 e posY <= 1245) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 784 e posX <= 864 e posY >= 1184 e posY <= 1245) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 774 e posX <= 834 e posY >= 0 e posY <= 40) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}
				
				esferaDoDev(140, 140)
				se (Esfera[0] == verdadeiro) {
					esfera(140, 140)
				}
				esferaDoDev(1370, 125)
				se (Esfera[1] == verdadeiro) {
					esfera(1370, 125)
				}
				esferaDoDev(1250, 650)
				se (Esfera[2] == verdadeiro) {
					esfera(1250, 650)
				}
				esferaDoDev(1240, 840)
				se (Esfera[3] == verdadeiro) {
					esfera(1240, 840)
				}
				esferaDoDev(40, 830)
				se (Esfera[4] == verdadeiro) {
					esfera(40, 830)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}
			
			se (EFormacao == 4) {
				se (posX >= 110 e posX <= 164 e posY >= 110 e posY <= 164) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 268 e posX <= 350 e posY >= 1091 e posY <= 1175) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 746 e posX <= 824 e posY >= 1341 e posY <= 1425) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 785 e posX <= 865 e posY >= 1181 e posY <= 1250) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 774 e posX <= 850 e posY >= 0 e posY <= 40) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 69 e posX <= 149 e posY >= 1314 e posY <= 1394) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd - perdeu
					}
				}
				se (posX >= 595 e posX <= 640 e posY >= 1190 e posY <= 1240) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd - perdeu
					}
				}
				se (posX >= 475 e posX <= 555 e posY >= 470 e posY <= 555) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd - perdeu
					}
				}
				
				esferaDoDev(140, 140)
				se (Esfera[0] == verdadeiro) {
					esfera(140, 140)
				}
				esferaDoDev(1150, 325)
				se (Esfera[1] == verdadeiro) {
					esfera(1150, 325)
				}
				esferaDoDev(1400, 800)
				se (Esfera[2] == verdadeiro) {
					esfera(1400, 800)
				}
				esferaDoDev(1240, 840)
				se (Esfera[3] == verdadeiro) {
					esfera(1240, 840)
				}
				esferaDoDev(40, 830)
				se (Esfera[4] == verdadeiro) {
					esfera(40, 830)
				}

				esferaDoDev(1370, 125)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(1370, 125)
				}
				esferaDoDev(1250, 650)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(1250, 650)
				}
				esferaDoDev(530, 530)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(530, 530)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}
			se (EFormacao == 5) {
				se (posX >= 514 e posX <= 595 e posY >= 231 e posY <= 315) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 95 e posX <= 174 e posY >= 256 e posY <= 340) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 105 e posX <= 185 e posY >= 691 e posY <= 775) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= -15 e posX <= 41 e posY >= 1181 e posY <= 1265) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 555 e posX <= 635 e posY >= 1201 e posY <= 1245) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 194 e posX <= 274 e posY >= 951 e posY <= 1035) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd - perdeu
					}
				}
				se (posX >= 170 e posX <= 250 e posY >= 1192 e posY <= 1280) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd - perdeu
					}
				}
				se (posX >= 144 e posX <= 225 e posY >= 1383 e posY <= 1450) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd - perdeu
					}
				}
				
				esferaDoDev(290, 570)
				se (Esfera[0] == verdadeiro) {
					esfera(290, 570)
				}
				esferaDoDev(315, 150)
				se (Esfera[1] == verdadeiro) {
					esfera(315, 150)
				}
				esferaDoDev(750, 160)
				se (Esfera[2] == verdadeiro) {
					esfera(750, 160)
				}
				esferaDoDev(1240, 40)
				se (Esfera[3] == verdadeiro) {
					esfera(1240, 40)
				}
				esferaDoDev(1260, 610)
				se (Esfera[4] == verdadeiro) {
					esfera(1260, 610)
				}

				esferaDoDev(1010, 250)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(1010, 250)
				}
				esferaDoDev(1250, 225)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(1250, 225)
				}
				esferaDoDev(1440, 200)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(1440, 200)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}

			se (EFormacao == 6) {
				se (posX >= 246 e posX <= 325 e posY >= 93 e posY <= 175) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 544 e posX <= 624 e posY >= 392 e posY <= 475) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 415 e posX <= 495 e posY >= 661 e posY <= 745) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 195 e posX <= 274 e posY >= 991 e posY <= 1075) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= -5 e posX <= 50 e posY >= 1181 e posY <= 1265) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + perdeu
					}
				}

				se (posX >= 303 e posX <= 386 e posY >= 661 e posY <= 744) {
					ed[0] = falso
					se (edc[0] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 744 e posX <= 824 e posY >= 1181 e posY <= 1265) {
					ed[1] = falso
					se (edc[1] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 744 e posX <= 824 e posY >= 81 e posY <= 165) {
					ed[2] = falso
					se (edc[2] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
					}
				}
				
				esferaDoDev(150, 300)
				se (Esfera[0] == verdadeiro) {
					esfera(150, 300)
				}
				esferaDoDev(450, 600)
				se (Esfera[1] == verdadeiro) {
					esfera(450, 600)
				}
				esferaDoDev(720, 470)
				se (Esfera[2] == verdadeiro) {
					esfera(720, 470)
				}
				esferaDoDev(1050, 250)
				se (Esfera[3] == verdadeiro) {
					esfera(1050, 250)
				}
				esferaDoDev(1240, 50)
				se (Esfera[4] == verdadeiro) {
					esfera(1240, 50)
				}

				esferaDoDev(720, 360)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(720, 360)
				}
				esferaDoDev(1240, 800)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(1240, 800)
				}
				esferaDoDev(140, 800)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(140, 800)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}

			se (EFormacao == 7) {
				se (posX >= 0 e posX <= 75 e posY >= 12 e posY <= 45) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 110 e posX <= 164 e posY >= 110 e posY <= 164) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 70 e posX <= 150 e posY >= 1312 e posY <= 1395) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 514 e posX <= 595 e posY >= 231 e posY <= 315) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 10 e posX <= 75 e posY >= 591 e posY <= 675) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}


				se (posX >= 303 e posX <= 386 e posY >= 661 e posY <= 744) {
					ed[0] = falso
					se (edc[0] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 246 e posX <= 325 e posY >= 93 e posY <= 175) {
					ed[1] = falso
					se (edc[1] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 194 e posX <= 274 e posY >= 951 e posY <= 1035) {
					ed[2] = falso
					se (edc[2] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
					}
				}
				
				esferaDoDev(20, 50)
				se (Esfera[0] == verdadeiro ){
					esfera(20, 50)
				}
				esferaDoDev(140, 140)
				se (Esfera[1] == verdadeiro ){
					esfera(140, 140)
				}
				esferaDoDev(1370, 125)
				se (Esfera[2] == verdadeiro ){
					esfera(1370, 125)
				}
				esferaDoDev(290, 570)
				se (Esfera[3] == verdadeiro ){
					esfera(290, 570)
				}
				esferaDoDev(650,50)
				se (Esfera[4] == verdadeiro ){
					esfera(650, 50)
				}
				
				esferaDoDev(720, 360)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(720, 360)
				}
				esferaDoDev(150, 300)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(150, 300)
				}
				esferaDoDev(1010, 250)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(1010, 250)
				}
				
				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = verdadeiro
							}
						}
						FSBonus = 0
						esferas = 5
				}
			}
		}

			se (EFormacao == 8) {
				se (posX >= 0 e posX <= 75 e posY >= 12 e posY <= 45) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 170 e posX <= 250 e posY >= 1192 e posY <= 1280) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 144 e posX <= 225 e posY >= 1383 e posY <= 1450) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 794 e posX <= 876 e posY >= 110 e posY <= 175) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 0 e posX <= 45 e posY >= 1175 e posY <= 1260) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 194 e posX <= 274 e posY >= 951 e posY <= 1035) {
					ed[0] = falso
					se (edc[0] == falso) {
						vd = vd + perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 695 e posX <= 775 e posY >= 1391 e posY <= 1435) {
					ed[1] = falso
					se (edc[1] == falso) {
						vd = vd + perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 93 e posX <=  174 e posY >= 761 e posY <= 845) {
					ed[2] = falso
					se (edc[2] == falso) {
						vd = vd + perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
					}
				}

				esferaDoDev(20, 50)
				se (Esfera[0] == verdadeiro ){
					esfera(20, 50)
				}
				esferaDoDev(1250, 225)
				se (Esfera[1] == verdadeiro ){
					esfera(1250, 225)
				}
				esferaDoDev(1440, 200)
				se (Esfera[2] == verdadeiro ){
					esfera(1440, 200)
				}
				esferaDoDev(150, 850)
				se (Esfera[3] == verdadeiro ){
					esfera(150, 850)
				}
				esferaDoDev(1235, 50)
				se (Esfera[4] == verdadeiro ){
					esfera(1235, 50)
				} 

				esferaDoDev(1010, 250)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(1010, 250)
				}
				esferaDoDev(1450, 750)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(1450, 750)
				}
				esferaDoDev(820, 150)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(820, 150)
				}

				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							esferas = 1

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}

			se (EFormacao == 9) {
				se (posX >= 95 e posX <= 174 e posY >= 183 e posY <= 264) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 305 e posX <= 385 e posY >= 672 e posY <= 754) {
					Esfera[1] = falso
					se (ec[1] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[1] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 415 e posX <= 494 e posY >= 293 e posY <= 374) {
					Esfera[2] = falso
					se (ec[2] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[2] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 415 e posX <= 494 e posY >= 1052 e posY <= 1134) {
					Esfera[3] = falso
					se (ec[3] == falso) {
						esferas = esferas-1
						ec[3] = verdadeiro
						vd = vd + ganhou
					}
				}
				se (posX >= 715 e posX <= 794 e posY >= 1052 e posY <= 1134) {
					Esfera[4] = falso
					se (ec[4] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[4] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 95 e posX <= 174 e posY >= 1181 e posY <= 1264) {
					ed[0] = falso
					se (edc[0] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 415 e posX <= 494 e posY >= 672 e posY <= 754) {
					ed[1] = falso
					se (edc[1] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 715 e posX <= 794 e posY >= 293 e posY <= 374) {
					ed[2] = falso
					se (edc[2] == falso) {
						vd = vd - perdeu
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
					}
				}

				esferaDoDev(240,150)
				se (Esfera[0] == verdadeiro ){
					esfera(240, 150)
				}
				esferaDoDev(730, 360)
				se (Esfera[1] == verdadeiro ){
					esfera(730, 360)
				}
				esferaDoDev(350, 470)
				se (Esfera[2] == verdadeiro ){
					esfera(350, 470)
				}
				esferaDoDev(1110,470)
				se (Esfera[3] == verdadeiro ){
					esfera(1110, 470)
				}
				esferaDoDev(1110,770)
				se (Esfera[4] == verdadeiro ){
					esfera(1110, 770)
				}

				esferaDoDev(1240, 150)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(1240, 150)
				}
				esferaDoDev(730, 470)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(730, 470)
				}
				esferaDoDev(350, 770)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(350, 770)
				}
				
				se (Esfera[0] == falso e Esfera[1] == falso e Esfera[2] == falso e Esfera[3] == falso e Esfera[4] == falso) {
					nivel = nivel +1
					se (nivel >= 9 e nivel % 10 < 1) {
						posX = 425
						posY = 720

						se (nivel == 10) {
							EFormacao = 10
							FSBonus = 1
							VelDoPerssonagem = 3

							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						} senao {
							EFormacao = 10
							FSBonus = u.sorteia(1, 4)
							VelDoPerssonagem = 3
							
							para (inteiro i = 0; i < 3; i++) {
								ed[i] = verdadeiro
								edc[i] = falso
								se (i < 1) {
									Esfera[i] = verdadeiro
									ec[i] = falso
								}
							}
						}
					} 
					senao {
						se (nivel < 10) {
							EFormacao = EFormacao +1
						} senao {
							EFormacao = u.sorteia(1, 9)
						}
						para (inteiro i = 0; i < 5; i++) {
							Esfera[i] = verdadeiro
							ec[i] = falso
							se (i < 3) {
								ed[i] = verdadeiro
								edc[i] = falso
							}
						}
						FSBonus = 0
						esferas = 5
					}
				}
			}

			//Fase Bonus
			
			se (FSBonus == 1) {
				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd + perdeu
					}
				}
				
				esferaDoDev(740,80)
				se (Esfera[0] == verdadeiro ){
					esfera(740, 80)
				}
				esferaDoDev(80,440)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(80, 440)
				}
				esferaDoDev(740,795)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(740, 795)
				}
				esferaDoDev(1395,440)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(1395, 440)
				}

				se (FaseB < 11) {
					se (Esfera[0] == falso) {
						se (nivel == 10) {
							FaseB++
							se (FaseB < 3) {
								FSBonus = 1
							} senao {
								FSBonus = 3
							}
						} senao {
							FaseB++
							FSBonus = u.sorteia(1, 4)
						}

						para (inteiro i = 0; i < 3; i++) {
							ed[i] = verdadeiro
							se (i == 0) {
								Esfera[i] = verdadeiro
							}
						}
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					nivel = 11
					para (inteiro i = 0; i < 5; i++) {
						Esfera[i] = verdadeiro
						ec[i] = falso
						se (i < 3) {
							ed[i] = verdadeiro
							edc[i] = falso
						}
					}
					esferas = 5
					FaseB = 1
				}
			}
			se (FSBonus == 2) {
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}
				
				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd + perdeu
					}
				}

				esferaDoDev(80,440)
				se (Esfera[0] == verdadeiro ){
					esfera(80,440)
				}
				esferaDoDev(740,80)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(740,80)
				}
				esferaDoDev(740,795)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(740,795)
				}
				esferaDoDev(1395,440)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(1395,440)
				}

				se (FaseB < 11) {
					se (Esfera[0] == falso) {
						se (nivel == 10) {
							FaseB++
							se (FaseB == 6 ou FaseB == 8) {
								FSBonus = 4
							}
						} senao {
							FaseB++
							FSBonus = u.sorteia(1, 4)
						}

						para (inteiro i = 0; i < 3; i++) {
							ed[i] = verdadeiro
							se (i == 0) {
								Esfera[i] = verdadeiro
							}
						}
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					nivel = 11
					para (inteiro i = 0; i < 5; i++) {
						Esfera[i] = verdadeiro
						ec[i] = falso
						se (i < 3) {
							ed[i] = verdadeiro
							edc[i] = falso
						}
					}
					esferas = 5
					FaseB = 1
				}
			}
			se (FSBonus == 3) {
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd + perdeu
					}
				}

				esferaDoDev(740,795)
				se (Esfera[0] == verdadeiro ){
					esfera(740,795)
				}
				esferaDoDev(740,80)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(740,80)
				}
				esferaDoDev(80,440)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(80,440)
				}
				esferaDoDev(1395,440)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(1395,440)
				}

				se (FaseB < 11) {
					se (Esfera[0] == falso) {
						se (nivel == 10) {
							FaseB++
							se (FaseB < 5) {
								FSBonus = 3
							} senao {
								FSBonus = 2
							}
						} senao {
							FaseB++
							FSBonus = u.sorteia(1, 4)
						}

						para (inteiro i = 0; i < 3; i++) {
							ed[i] = verdadeiro
							se (i == 0) {
								Esfera[i] = verdadeiro
							}
						}
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					nivel = 11
					para (inteiro i = 0; i < 5; i++) {
						Esfera[i] = verdadeiro
						ec[i] = falso
						se (i < 3) {
							ed[i] = verdadeiro
							edc[i] = verdadeiro
						}
					}
					esferas = 5
					FaseB = 1
				}
			}
			se (FSBonus == 4) {
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
						vd = vd + ganhou
					}
				}

				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
						vd = vd + perdeu
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
						vd = vd + perdeu
					}
				}

				esferaDoDev(1395,440)
				se (Esfera[0] == verdadeiro ){
					esfera(1395,440)
				}
				esferaDoDev(740,80)
				se (ed[0] == verdadeiro) {
					esferaDisfarcada(740,80)
				}
				esferaDoDev(80,440)
				se (ed[1] == verdadeiro) {
					esferaDisfarcada(80,440)
				}
				esferaDoDev(740,795)
				se (ed[2] == verdadeiro) {
					esferaDisfarcada(740,795)
				}

				se (FaseB < 11) {
					se (Esfera[0] == falso) {
						se (nivel == 10) {
							FaseB++
							se (FaseB == 7) {
								FSBonus = 2
							} 
							senao se (FaseB == 9) {
								FSBonus = 4
							}
							senao {
								FSBonus = 3
							}
						} senao {
							FaseB++
							FSBonus = u.sorteia(1, 4)
						}
						para (inteiro i = 0; i < 3; i++) {
							ed[i] = verdadeiro
							se (i == 0) {
								Esfera[i] = verdadeiro
							}
						}
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					nivel = 11
					para (inteiro i = 0; i < 5; i++) {
						Esfera[i] = verdadeiro
						ec[i] = falso
						se (i < 3) {
							ed[i] = verdadeiro
							edc[i] = verdadeiro
						}
					}
					esferas = 5
					FaseB = 1
				}
			}
			
			// Controla o FPS
       		inteiro tempoAgora = u.tempo_decorrido()
         		enquanto(tempoAgora - tempoAnterior < 1000/60) {
         	 		// Aguarda até que o tempo necessário para atingir o FPS desejado tenha passado
         	 		tempoAgora = u.tempo_decorrido()
         	 	}
          	tempoAnterior = tempoAgora
          
			//gameover()
			
			g.renderizar()

			se (t.tecla_pressionada(27)) {
				jg = falso
			}
		}
	}

	funcao inteiro personagem(inteiro cpoY, inteiro cpoX, inteiro passos, inteiro vida, logico andando) {
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(cpoX, cpoY, 58, 56, falso, verdadeiro)

		se (vida > 0 e vida <= 100) {
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_retangulo(cpoX - 22, cpoY + 60, vida, 10, falso, verdadeiro)
		}
		senao se (vida > 100) {
			se (vida > 200) {
				vida = 200
			}
			g.definir_cor(g.COR_BRANCO)
			g.desenhar_retangulo(cpoX - 22, cpoY + 60, 100, 10, falso, verdadeiro)
			g.definir_cor(g.COR_AMARELO)
			g.desenhar_retangulo(cpoX - 22, cpoY + 60, vida - 100, 10, falso, verdadeiro)
		}
		
		retorne vida
	}

	funcao bonus() {
		g.definir_cor(g.COR_VERDE)

		//PAREDES CIMA
		g.desenhar_retangulo(0, 0, 650, 20, falso, falso)
		g.desenhar_retangulo(850, 0, 650, 20, falso, falso)
		//PAREDES BAIXO
		g.desenhar_retangulo(0, 880, 650, 20, falso, falso)
		g.desenhar_retangulo(850, 880, 650, 20, falso, falso)
		//PAREDES ESQUERDA
		g.desenhar_retangulo(0, 0, 20, 350, falso, falso)
		g.desenhar_retangulo(0, 550, 20, 350, falso, falso)
		//PAREDES DIREITA
		g.desenhar_retangulo(1480, 0, 20, 350, falso, falso)
		g.desenhar_retangulo(1480, 550, 20, 350, falso, falso)

		//CAIXA
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(650, 350, 201, 10, falso, verdadeiro)//CIMA
		g.desenhar_retangulo(650, 550, 201, 10, falso, verdadeiro)//BAIXO
		g.desenhar_retangulo(650, 350, 10, 201, falso, verdadeiro)//ESQUERDA
		g.desenhar_retangulo(840, 350, 10, 201, falso, verdadeiro)//DIRETA

		g.desenhar_retangulo(650, 0, 201, 201, falso, falso)//CAIXA CIMA
		g.desenhar_retangulo(650, 698, 201, 201, falso, falso)//CAIXA BAIXO
		g.desenhar_retangulo(0, 350, 201, 201, falso, falso)//CAIXA ESQUERDA
		g.desenhar_retangulo(1298, 350, 201, 201, falso, falso)//CAIXA DIREITA
	}

	funcao cenario(logico nv1, logico nv6, logico nv8,logico nv9,logico nv11) {
		se (nv1 == verdadeiro) {
			g.definir_cor(g.COR_VERDE)
			//PAREDE SUPERIOR
			g.desenhar_retangulo(1, 1, 100, 10, falso, verdadeiro)// parede cima esquerda (PAREDE: 1)
			g.desenhar_retangulo(200, 1, 1000, 10, falso, verdadeiro)// parede cima meio (PAREDE: 2)
			g.desenhar_retangulo(1300, 1, 200, 10, falso, verdadeiro)// parede sima direita (PAREDE: 3)
			//PAREDE INFERIOR
			g.desenhar_retangulo(1, 890, 100, 10, falso, verdadeiro)// parede baixo esquerdo (PAREDE: 4)
			g.desenhar_retangulo(200, 890, 1000, 10, falso, verdadeiro)// parede baixo meio (PAREDE: 5)
			g.desenhar_retangulo(1300, 890, 200, 10, falso, verdadeiro)// parede baixo direita (PAREDE: 6)
			//PAREDE ESQUERDA
			g.desenhar_retangulo(1, 1, 10, 800, falso, verdadeiro)
			//PAREDE DIREITA
			g.desenhar_retangulo(1490, 1, 10, 800, falso, verdadeiro)

			//QUADRADOS
			g.desenhar_retangulo(700, 400, 50, 50, falso, verdadeiro)
			g.desenhar_retangulo(310, 310, 50, 50, falso, verdadeiro)
			g.desenhar_retangulo(910, 620, 50, 50, falso, verdadeiro)
			//PONTO A (L SUPERIOR ESQUERDO)
			g.desenhar_retangulo(100, 100, 10, 100, falso, verdadeiro)
			g.desenhar_retangulo(100, 100, 100, 10, falso, verdadeiro)
			//PONTO B (L SUPERIOR DIREITO)
			g.desenhar_retangulo(1300, 100, 10, 100, falso, verdadeiro)
			g.desenhar_retangulo(1200, 100, 100, 10, falso, verdadeiro)
			//PONTO D (L INFERIOR DIREITO)
			g.desenhar_retangulo(1200, 690, 100, 10, falso, verdadeiro)
			g.desenhar_retangulo(1300, 600, 10, 100, falso, verdadeiro)
			//COVER`S INFERIORES
			g.desenhar_retangulo(1300, 800, 10, 100, falso, verdadeiro)// DIREITO
			g.desenhar_retangulo(100, 800, 10, 100, falso, verdadeiro)//  ESQUERDO
		}
		se (nv6 == verdadeiro) {
			//QUADRADO DO MEIO
			g.desenhar_retangulo(700, 400, 100, 50, falso, verdadeiro)
			//PONTO C (L INFERIOR ESQUERDO)
			g.desenhar_retangulo(100, 610, 10, 100, falso, verdadeiro)
			g.desenhar_retangulo(100, 700, 100, 10, falso, verdadeiro)
		}
		se (nv8 == verdadeiro) {
			//PONTO A2 (L SUPERIOR ESQUERDO 2)
			g.desenhar_retangulo(400, 100, 10, 100, falso, verdadeiro)
			g.desenhar_retangulo(300, 100, 100, 10, falso, verdadeiro)
			//PONTO C2 (L INFERIOR ESQUERDO 2)
			g.desenhar_retangulo(400, 610, 10, 100, falso, verdadeiro)
			g.desenhar_retangulo(300, 700, 100, 10, falso, verdadeiro)
		}
		se (nv9 == verdadeiro) {
			//AGUA
			g.definir_cor(-27600)
			g.desenhar_retangulo(110, 110, 290, 590, falso, verdadeiro)
			//QUADRADO
			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(310, 310, 50, 50, falso, verdadeiro)
		}
		se (nv11 == verdadeiro) {
			//AGUA
			g.definir_cor(-27600)
			g.desenhar_retangulo(1000, 110, 300, 200, falso, verdadeiro)
			//CASA
			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(600, 270, 10, 245, falso, verdadeiro)// Parede ESQUERDA
			g.desenhar_retangulo(890, 270, 10, 245, falso, verdadeiro)// Parede DIREITA
			g.desenhar_retangulo(600, 270, 300, 10, falso, verdadeiro)// Parede CIMA
			g.desenhar_retangulo(700, 510, 200, 10, falso, verdadeiro)// Parede BAIXO
			g.desenhar_retangulo(700, 350, 10, 160, falso, verdadeiro)// Parede MEIO
			//QUADRADO
			g.desenhar_retangulo(310, 310, 50, 50, falso, verdadeiro)
			//COVER`S INFERIORES
			g.desenhar_retangulo(1200, 800, 10, 100, falso, verdadeiro)// DIREITO 2
			g.desenhar_retangulo(200, 800, 10, 100, falso, verdadeiro)//  ESQUERDO 2
		}
	}
	
	//Esferas
	funcao esfera(inteiro X, inteiro Y) {
		g.definir_cor(g.COR_AMARELO)
		g.desenhar_retangulo(X, Y, 25, 25, falso, verdadeiro)
	}
	funcao esferaDisfarcada(inteiro X, inteiro Y) {
		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_retangulo(X, Y, 25, 25,falso,  verdadeiro)
	}

	funcao gameover() {
		g.definir_cor(-1)
		g.desenhar_retangulo(550, 200, 400, 500, verdadeiro, verdadeiro)
		g.definir_cor(0)
		g.desenhar_retangulo(555, 205, 390, 490, verdadeiro, verdadeiro)

		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_texto(640, 250, "Fim De Jogo")
	}

	//Ferramentas do Desenvolvimento
	funcao esferaDoDev(inteiro X, inteiro Y) {
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(X, Y, 25, 25,falso,  verdadeiro)
	}

	funcao infoDev(inteiro posY, inteiro posX) {
		g.definir_cor(g.COR_PRETO)
		g.desenhar_retangulo(1, 2, 100, 50, falso, verdadeiro)
		
		g.definir_cor(g.COR_BRANCO)
		g.definir_estilo_texto(falso, verdadeiro, verdadeiro)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(2, 2, "X:")
		g.desenhar_texto(25, 2, tp.inteiro_para_cadeia(posY,10))
		g.desenhar_texto(85, 2, "VAR: posY")
		g.desenhar_texto(2, 20, "Y:")
		g.desenhar_texto(25, 20, tp.inteiro_para_cadeia(posX,10))
		g.desenhar_texto(85, 20, "VAR: posX")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6019; 
 * @DOBRAMENTO-CODIGO = [1893, 1903, 1911, 1919, 1929, 1933, 1937, 1941, 1986, 1996, 2004, 2012, 2022, 2026, 2030, 2034, 2077, 2087, 2095, 2103, 2113, 2117, 2121, 2125, 2170, 2180, 2188, 2196, 2206, 2210, 2214, 2218];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */