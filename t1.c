#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <locale.h>

char** aloca(char** vet, int tamanho_vetor_string){
	int i;
	vet = (char**)malloc(sizeof(char*)*tamanho_vetor_string);

	for(i=0; i<1 ; i++)
		vet[i] = (char*)malloc(sizeof(char)*50);
}

int contalinhas (FILE* arq, char* s, int linhas){
	int i=0;

	while (s[i] != '\0'){
		if (s[i] == '\n'){
			linhas++;
		}
		i++;
	}

	return linhas+1;
}

int contacolunas (FILE* arq, char* s, int colunas){
	int i=0, maior=0;

	while (s[i] != '\0'){
		if (s[i] != '\n'){
			colunas++;
		} else if (s[i] == '\n'){
			if (colunas > maior)
				maior = colunas;
			colunas = 0;
		}
		i++;
	}
	colunas = maior;
	return colunas;
}

int comp (const void* string1, const void* string2){
	if (string1 == NULL || string2 == NULL){
		exit(1);//n pode dar return
	}
	
	return strcmp(string1, string2);
}

void fim(char** mat, int cont){
	int i;
	
	FILE* ed = fopen("saida.html", "w+");
	
	fprintf (ed, "<body>");
	
	for (i=0 ; i<cont ; i++){
		fprintf (ed, "-> %s<br>", mat[i]);
	}
	
	fprintf (ed, "</body>");
}

void inicio(FILE* arq, char** mat, char ch, char* s, char* aux){
	int i=0, j=0, cont=0;
	printf ("Exibindo todos os candidatos:\n");
	while( (ch=fgetc(arq))!= EOF){
		*(s+i) = ch; //passa os nomes para string
		*(aux+j) = ch; //salva linhas
		if (ch == '\n'){
		*(aux+j+1) = '\0';
			if (aux[0] == 'R'){
				cont++;
			}
			j=0;
		} else {
			j++;
		}
		i++;
		putchar(ch);
	}
	*(s+i) = '\0'; //evitar problema com o ultmo nome
	*(aux+j+1) = '\0';
	
	if (aux[0] == 'R')
		cont++;
		
	mat = aloca(mat, cont+1); //aloca a matriz
	
	i=0;
	j=0;
	cont=0;
	
	while (*(s+i) == '\0'){
		*(aux+j) = *(s+i);
		
		if (*(s+i) = '\n'){
			*(aux+j+1) = '\0';
			if (aux[0] == 'R'){
				strcpy (mat[cont], aux); //passa os nomes na string pra matriz
				cont++;
			}
			j=0;
		} else {
			j++;
		}
		i++;
	}
	
	*(aux+j+1) = '\0';
	
	if (aux[0] == 'R'){
		strcpy (mat[cont], aux);//salva os clientes com R
		cont++;
	}
	
	qsort (mat, (size_t)cont, sizeof(char*), comp);
	
	fim(mat, cont);
}

int main(){

	setlocale(LC_ALL, "Portuguese");
	FILE *arq;
	char** mat;
	char ch;
	char s[200], aux[50];
	int linhas=0, colunas=0, i, j;

	arq = fopen("Cliente.txt", "r");

	if (arq==NULL){
		printf ("Erro.\n");
	}

	inicio(arq, mat, ch, s, aux);
	
	fclose(arq);
	return 0;
}
