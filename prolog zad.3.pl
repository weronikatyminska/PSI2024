:- dynamic produkt/3.
produkt(tv, 10, sektor_a).
produkt(pralka, 5, sektor_b).
produkt(lodowka, 3, sektor_c).
produkt(komoda, 8, sektor_d).
produkt(stolik, 0, sektor_d).

dostepny_produkt(X) :- produkt(X,Y,_), Y > 0.
% ?- dostepny_produkt(tv) wynik: true, ?- dostepny_produkt(stolik) wynik: false

przenies_produkt(X,Z) :- produkt(X,Y,_), retract(produkt(X,Y,_)), assertz(produkt(X,Y,Z)), write(produkt(X,Y,Z)).
% ?- przenies_produkt(pralka, sektor_a) wynik: produkt(pralka,5,sektor_a),true

uzupelnij_stan(X, N) :- produkt(X,Y,Z), A is Y + N, write(produkt(X,A,Z)). 
% ?- uzupelnij_stoli(stolik,10) wynik: produkt(stolik,10,sektor_d), true                                                          