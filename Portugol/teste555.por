programa
{
	
	funcao inicio()
	{
		se (FSBonus == 1) {
				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
					}
				}
				
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
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
							FSBonus = 2
						} senao {
							FSBonus = u.sorteia(1, 4)
						}
						Esfera[0] = verdadeiro
						ed[0] = verdadeiro
						ed[1] = verdadeiro
						ed[2] = verdadeiro
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					Esfera[0] = verdadeiro
					Esfera[1] = verdadeiro
					Esfera[2] = verdadeiro
					Esfera[3] = verdadeiro
					Esfera[4] = verdadeiro
					ed[0] = verdadeiro
					ed[1] = verdadeiro
					ed[2] = verdadeiro
					ec[0] = falso
					ec[1] = falso
					ec[2] = falso
					ec[3] = falso
					ec[4] = falso
					edc[0] = falso
					edc[1] = falso
					edc[2] = falso
					esferas = 5
				}
			}
			se (FSBonus == 2) {
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
					}
				}
				
				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
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
							FSBonus = 2
						} senao {
							FSBonus = u.sorteia(1, 4)
						}
						Esfera[0] = verdadeiro
						ed[0] = verdadeiro
						ed[1] = verdadeiro
						ed[2] = verdadeiro
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					Esfera[0] = verdadeiro
					Esfera[1] = verdadeiro
					Esfera[2] = verdadeiro
					Esfera[3] = verdadeiro
					Esfera[4] = verdadeiro
					ed[0] = verdadeiro
					ed[1] = verdadeiro
					ed[2] = verdadeiro
					ec[0] = falso
					ec[1] = falso
					ec[2] = falso
					ec[3] = falso
					ec[4] = falso
					edc[0] = falso
					edc[1] = falso
					edc[2] = falso
					esferas = 5
				}
			}
			se (FSBonus == 3) {
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
					}
				}

				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
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
							FSBonus = 2
						} senao {
							FSBonus = u.sorteia(1, 4)
						}
						Esfera[0] = verdadeiro
						ed[0] = verdadeiro
						ed[1] = verdadeiro
						ed[2] = verdadeiro
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					Esfera[0] = verdadeiro
					Esfera[1] = verdadeiro
					Esfera[2] = verdadeiro
					Esfera[3] = verdadeiro
					Esfera[4] = verdadeiro
					ed[0] = verdadeiro
					ed[1] = verdadeiro
					ed[2] = verdadeiro
					ec[0] = falso
					ec[1] = falso
					ec[2] = falso
					ec[3] = falso
					ec[4] = falso
					edc[0] = falso
					edc[1] = falso
					edc[2] = falso
					esferas = 5
				}
			}
			se (FSBonus == 4) {
				se (posX >= 384 e posX <= 464 e posY >= 1337 e posY <= 1419) {
					Esfera[0] = falso
					se (ec[0] == falso) {
						EsferasColetadas = EsferasColetadas +1
						esferas = esferas-1
						ec[0] = verdadeiro
					}
				}

				se (posX >= 25 e posX <= 105 e posY >= 681 e posY <= 765) {
					ed[0] = falso
					se (edc[0] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[0] = verdadeiro
					}
				}
				se (posX >= 384 e posX <= 464 e posY >= 20 e posY <= 104) {
					ed[1] = falso
					se (edc[1] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[1] = verdadeiro
					}
				}
				se (posX >= 740 e posX <= 820 e posY >= 681 e posY <= 765) {
					ed[2] = falso
					se (edc[2] == falso) {
						EsferasColetadas = EsferasColetadas -1
						edc[2] = verdadeiro
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
							FSBonus = 2
						} senao {
							FSBonus = u.sorteia(1, 4)
						}
						Esfera[0] = verdadeiro
						ed[0] = verdadeiro
						ed[1] = verdadeiro
						ed[2] = verdadeiro
						esferas = 1
						posX = 425
						posY = 720
					}
				} senao {
					FSBonus = 0
					EFormacao = u.sorteia(1, 9)
					Esfera[0] = verdadeiro
					Esfera[1] = verdadeiro
					Esfera[2] = verdadeiro
					Esfera[3] = verdadeiro
					Esfera[4] = verdadeiro
					ed[0] = verdadeiro
					ed[1] = verdadeiro
					ed[2] = verdadeiro
					ec[0] = falso
					ec[1] = falso
					ec[2] = falso
					ec[3] = falso
					ec[4] = falso
					edc[0] = falso
					edc[1] = falso
					edc[2] = falso
					esferas = 5
				}
			}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 7963; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */