:- dynamic ojciec/2.
:- dynamic matka/2. 

ojciec(jan, ewa).
ojciec(piotr, kasia).
ojciec(piotr, ola).
ojciec(tomek, piotr).
ojciec(waldek,jan).
matka(maria, ewa).
matka(anna, kasia).
matka(anna, ola).

wiek(jan, 45).
wiek(ewa, 12).
wiek(piotr, 36).
wiek(kasia, 18).
wiek(ola, 22).
wiek(tomek, 75).
wiek(waldek, 68).
wiek(maria, 38).
wiek(anna, 30).


rodzic(X, Y) :- ojciec(X, Y).
rodzic(X, Y) :- matka(X, Y).


dziadek(X,Y) :- rodzic(X,Z), rodzic(Z,Y).

siostra(X,Y) :- rodzic(Z,X), rodzic(Z,Y).

jest_rodzicem(X) :- ojciec(X,_).
jest_rodzicem(X) :- matka(X,_).

%lista_dziecko(X, ListaDzieci) :- findall(Dziecko, rodzic(X, Dziecko), ListaDzieci).
%czyj_rodzic(X, ListaDzieci) :- lista_dziecko(X, ListaDzieci).

czyj_rodzic(X, ListaDzieci) :- findall(Dziecko, rodzic(X, Dziecko), ListaDzieci).

rodzic_cut(X, Y) :- rodzic(X,Y), !.
rodzic_bez_cut(X, Y) :- rodzic(X,Y).

rodzic(X, Y) :- (ojciec(X, Y); matka(X, Y)), !.

starszy(X,Y) :- wiek(X, WiekX), wiek(Y, WiekY), WiekX > WiekY.

wiek_wiecej_niz(N) :-  wiek(X, Wiek), Wiek > N, write(X), write(' , '), fail.
%wiek_wiecej_niz(_).

%11??????nie działa w swishu??????
dodaj_fakt(X) :- assertz(X).
usun_fakt(X) :- retract(X).

%12














