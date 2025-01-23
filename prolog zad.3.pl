:- dynamic produkt/3.
produkt(tv, 10, sektor_a).
produkt(pralka, 5, sektor_b).
produkt(lodowka, 3, sektor_c).
produkt(komoda, 8, sektor_d).
produkt(stolik, 0, sektor_d).

dostepny_produkt(X) :- produkt(X,Y,_), Y > 0.
% ?- dostepny_produkt(tv) wynik: true, ?- dostepny_produkt(stolik) wynik: false

przenies_produkt(X,Z) :- produkt(X,Y,_), retract(produkt(X,Y,_)), assertz(produkt(X,Y,Z)), write(produkt(X,Y,Z)).
% ?- przenies_produkt(komoda, sektor_a). wynik: produkt(komoda,8,sektor_a)true. , ?- produkt(komoda, X,Y). X = 8, Y = sektor_a.

% ta wersja nie do końca działa
% uzupelnij_stan(X, N) :- produkt(X,Y,Z), A is Y + N, write(produkt(X,A,Z)). 
% ?- uzupelnij_stan(stolik,10) wynik: produkt(stolik,10,sektor_d), true 

% ulepszona wersja do SWI Prolog:
uzupelnij_stan(X, N) :- produkt(X, Z, Y), A is Z + N, retract(produkt(X, Z, Y)), assertz(produkt(X, A, Y)), write(produkt(X, A, Y)). 
% ?- uzupelnij_stan(stolik,10). wynik: produkt(stolik,10,sektor_d)true. ?- produkt(stolik,X,Y). X = 10, Y = sektor_d.
