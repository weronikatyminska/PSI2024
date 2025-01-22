ojciec(jan, ewa).
ojciec(piotr, bartek).
ojciec(piotr, ola).
ojciec(wojtek, maria).
ojciec(wojtek, anna).
matka(maria, ewa).
matka(anna, bartek).
matka(anna, ola).
matka(wiola, maria).
matka(wiola, anna).
malzenstwo(jan, maria).
malzenstwo(piotr,anna).
malzenstwo(wojtek, wiola).
mezczyzna(wojtek).
mezczyzna(piotr).
mezczyzna(jan).
kobieta(wiola).
kobieta(maria).
kobieta(anna).

rodzic(X, Y) :- ojciec(X, Y).
rodzic(X, Y) :- matka(X, Y).

przodek(X,Y) :- rodzic(X,Y).
przodek(X,Y) :- rodzic(X,Z), przodek(Z,Y).

% ?- przodek(wojtek, ola) wynik: true, ?- przodek(anna, ola) wynik: true, ?- przodek(maria, ola) wynik: false

brat(X,Y) :- rodzic(Z,X), rodzic(Z,Y), X \=Y, ojciec(_,X).
siostra(X,Y) :- rodzic(Z,X), rodzic(Z,Y), X \=Y, matka(_,X).

% ?- brat(wojtek, ola) wynik: false, ?- brat(bartek, ola) wynik: true

kuzyn(X,Y) :- rodzic(A,X), rodzic(B,Y), siostra(A,B),X \=Y.
kuzyn(X,Y) :- rodzic(A,X), rodzic(B,Y), brat(A,B),X \=Y.

% ?- kuzyn(ola,ewa) wynik: true, ?- kuzyn(bartek,ewa) wynik: true, ?- kuzyn(bartek,ola) wynik: false
