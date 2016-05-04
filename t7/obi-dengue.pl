%Combate a Dengue

%Casa F deve ser uma das 3 primeiras
regra1(L) :-
  nth0(0, L, f);
  nth0(1, L, f);
  nth0(2, L, f).

%A casa H deve ser visitada imediatamente antes da G
esquerda(A, B, L) :-
  nextto(A, B, L).
regra2(L) :- esquerda(h, g, L).

%A casa L não pode ser a primeira nem a sétima a ser visitada
regra3(L) :-
  nth0(1, L, l);
  nth0(2, L, l);
  nth0(3, L, l);
  nth0(4, L, l);
  nth0(5, L, l).

%A casa M deve ser a primeira ou a sétima visitada
regra4(L) :-
  nth0(0, L, m);
  nth0(6, L, m).

%A casa P deve ser uma das 3 últimas
regra5(L) :-
  nth0(4, L, p);
  nth0(5, L, p);
  nth0(6, L, p).

%permutações
perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).

delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).

dengue(L) :-
  L = [_,_,_,_,_,_,_],
  Casas = [f, g, h, l, m, p, t],
  perm(L, Casas),
  regra1(L),
  regra2(L),
  regra3(L),
  regra4(L),
  regra5(L).

exerc2(L, R) :-
  L = [_,_,_,_,_,_,_],
  Casas = [f, g, h, l, m, p, t],
  perm(L, Casas),
  esquerda(t, l, L),
  esquerda(l, f, L),
  regra1(L),
  regra2(L),
  regra3(L),
  regra4(L),
  regra5(L),
  nth1(R, L, g).

exerc5(L, R) :-
  L = [_,_,_,_,_,_,_],
  Casas = [f, g, h, l, m, p, t],
  perm(L, Casas),
  esquerda(f, R, L),
  esquerda(R, p, L),
  regra1(L),
  regra2(L),
  regra3(L),
  regra4(L),
  regra5(L).

/*
Exercicio 1
Qual das seguintes opções é uma lista completa e correta da ordem que as sete casas devem ser visitadas?
A) F, T, H, L, P, G e M
B) H, G, F, L, T, P e M
C) L, T, F, H, G, M e P
D) M, F, D, H, L, G e T
E) M, L, H, G, F, P e T

Consultas:
dengue([f,t,h,l,p,g,m]).
dengue([h,g,f,l,t,p,m]).
dengue([l,t,f,h,g,m,p]).
dengue([m,f,d,h,l,g,t]).
dengue([m,l,h,g,f,p,t]).
*/

/*
Exercicio 2
Se em um trecho do percurso visitarmos as casas T, L e F, exatamente nesta ordem, qual a posição que G foi visitada?
A) Segunda
B) Terceira
C) Quarta
D) Quinta
E) Sexta

Consultas:
exerc2(L, 2).
exerc2(L, 3).
exerc2(L, 4).
exerc2(L, 5).
exerc2(L, 6).

ou

exerc2(L, R). %R sai com a resposta direta.
*/

/*
Exercicio 3
Se a casa H é a primeira a ser visitada, qual a quarta casa a ser visitada?
A) F
B) G
C) L
D) M
E) P

Consultas:
dengue([h,_,_,f,_,_,_]).
dengue([h,_,_,g,_,_,_]).
dengue([h,_,_,l,_,_,_]).
dengue([h,_,_,m,_,_,_]).
dengue([h,_,_,p,_,_,_]).
*/

/*
Exercicio 5
Se exatamente uma casa foi visitada entre F e P, quais poss´ıveis casas são estas?
A) G e H
B) G e T
C) H e M
D) L e M
E) L e T

Consultas:
exerc5(L, R). %Precisa usar o ; pra ver a segunda casa.
*/
