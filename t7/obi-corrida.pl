%Corrida de Bicicleta

%permutações
perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).

delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).

regra1(L) :-
  nth0(X, L, f), nth0(Y, L, e), nth0(Z, L, g),
  ( X < Y, Z > Y;
    X > Y, Y > Z).

regra2(L) :-
  nth0(X, L, c), nth0(Y, L, b),
  X < Y.

regra3(L) :-
  nth0(X, L, a), nth0(Y, L, d),
  Y1 is Y+1, Y2 is Y-1,
  X =\= Y1, X =\= Y2.

regra4(L) :-
  nth0(X, L, g), X < 6.

regra5(L) :-
  nth0(X, L, d), X > 0.

corrida(L) :-
  L = [_,_,_,_,_,_,_],
  Garotos = [a, b, c, d, e, f, g],
  perm(L, Garotos),
  regra1(L), regra2(L), regra3(L), regra4(L), regra5(L).

ex12(L, R) :-
  L = [_,_,_,_,_,_,_],
  Garotos = [a, b, c, d, e, f, g],
  perm(L, Garotos),
  regra1(L), regra2(L), regra3(L), regra4(L), regra5(L),
  nth0(2, L, f),
  nth0(4, L, e),
  nth0(6, L, a),
  nth0(3, L, R).

ex13(L, R) :-
  L = [_,_,_,_,_,_,_],
  Garotos = [a, b, c, d, e, f, g],
  perm(L, Garotos),
  regra1(L), regra2(L), regra3(L), regra4(L), regra5(L),
  nth0(0, L, a),
  nth0(1, L, c),
  nth0(2, L, b),
  nth0(6, L, R).

ex14(L, R) :-
  L = [_,_,_,_,_,_,_],
  Garotos = [a, b, c, d, e, f, g],
  perm(L, Garotos),
  regra1(L), regra2(L), regra3(L), regra4(L), regra5(L),
  nth0(1, L, a),
  nth0(3, L, d),
  nth0(6, L, b),
  nth0(0, L, R).

/*
Consultas:

Exercicio 11
A) corrida([a,b,c,d,e,f,g]).
B) corrida([g,e,f,b,a,c,d]).
C) corrida([a,d,f,e,g,c,b]).
D) corrida([d,f,e,g,a,c,b]).
E) corrida([f,d,e,g,c,b,a]).

Exercicio 12
ex12(L, R). (Retorna os dois casos, necessita do uso do ;)

Exercicio 13
ex13(L, R).

Exercicio 14
ex14(L, R).
*/
