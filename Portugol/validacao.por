//APAGAR CÓDIGO---INICIO-------------------------------\
programa
{
	
	funcao inicio()
	{
		inteiro n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11
		n1 = 0
		n2 = 9
		n3 = 6
		n4 = 8
		n5 = 1
		n6 = 2
		n7 = 4
		n8 = 5
		n9 = 1
		n10 = 8
		n11 = 0
		//APAGAR CÓDIGO---FIM---------------------------/
		
		//cÓDIGO DE VALIDAÇÃO----INCIO-----------------------------------------\
		
		escreva("cpf digitado: ",n1,n2,n3,".",n4,n5,n6,".",n7,n8,n9,"-",n10,n11)
		escreva("\nAnalisando o cpf, aguarde...")
		
		inteiro resultado, digito10, digito11
		inteiro sn1,sn2,sn3,sn4,sn5,sn6,sn7,sn8,sn9

		sn1 = n1 * 10
		sn2 = n2 * 9
		sn3 = n3 * 8
		sn4 = n4 * 7
		sn5 = n5 * 6
		sn6 = n6 * 5
		sn7 = n7 * 4
		sn8 = n8 * 3
		sn9 = n9 * 2
		resultado = (sn1+sn2+sn3+sn4+sn5+sn6+sn7+sn8+sn9) % 11

		se (resultado < 2) {
			digito10 = 0
		} senao {
			digito10 = 11 - resultado
		}

		se (n10 == digito10) {
			sn1 = n2 * 10
			sn2 = n3 * 9
			sn3 = n4 * 8
			sn4 = n5 * 7
			sn5 = n6 * 6
			sn6 = n7 * 5
			sn7 = n8 * 4
			sn8 = n9 * 3
			sn9 = n10 * 2
			resultado = (sn1+sn2+sn3+sn4+sn5+sn6+sn7+sn8+sn9) % 11

			se (resultado < 2) {
				digito11 = 0
			} senao {
				digito11 = 11 - resultado
			}

			se (n11 == digito11) {
				escreva("\n")
				escreva("\nCPF VALIDO")
				escreva("\n")
			}
		} senao {
			escreva("\n")
			escreva("CPF IMVALIDO")
			escreva("\n")
		}

		//cÓDIGO DE VALIDAÇÃO----FIM--------------------------------------------/

		//APAGAR AS DUAS CHAVES A SEGUIR-------------------------------\
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 15; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */