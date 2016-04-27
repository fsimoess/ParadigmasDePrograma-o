%Exercicio 1
zeroInit(L) :- L = [H | _], H = 0.

%Exercicio 2
has5(L) :- L = [_,_,_,_,_].

%Exercicio 3
hasN([], 0).
hasN(L, N) :-
  N > 0,
  L = [_ | T],
  N1 is N - 1,
  hasN(T, N1).

%Exercicio 4
potN0(-1,[]).
potN0(N,L) :-
  N >= 0,
  P is 2^N,
  L = [P | T],
  N1 is N - 1,
  potN0(N1, T).

%Exercicio 5
zipmult([],[],[]).
zipmult(L1,L2,L3) :-
  L1 = [H1 | T1],
  L2 = [H2 | T2],
  H3 is H1*H2,
  L3 = [H3 | T3],
  zipmult(T1, T2, T3).

%Exercicio 6
potencias(N,L) :-
  aux(0, N, L).

aux(N, N, []).
aux(N1, N, L) :-
  N1 =< N,
  N2 is N1 + 1,
  H is 2^N1,
  L = [H | T],
  aux(N2, N, T).

%Exercicio 7
positivos([],[]).
positivos(L1,L2) :-
  L1 = [H1 | T1],
  H1 > 0,
  H2 is H1,
  L2 = [H2 | T2],
  positivos(T1, T2).
positivos([H1 | T1], L2) :-
  H1 < 1,
  positivos(T1, L2).

%Exercicio 8
mesmaPosicao('',[],[]).
mesmaPosicao(A,L1,L2) :-
  L1 = [H1 | T1],
  L2 = [H2 | T2],
  A = H1,
  A = H2.
mesmaPosicao(A,[_ | T1],[_ | T2]) :-
  mesmaPosicao(A,T1,T2).

%Exercicio 9
comissao(0,_,[]).
comissao(N,[H|T1],[H|T2]) :-
  N > 0,
  N1 is N-1,
  comissao(N1,T1,T2).
comissao(N,[_|T1],T2) :-
  N > 0,
  comissao(N,T1,T2).

%Exercicio 10
