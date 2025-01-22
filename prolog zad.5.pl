
:- dynamic ocena/3.


ksiazka('W pustyni i w puszczy', sienkiewicz, przygodowa).
ksiazka('Hobbit', tolkien, fantasy).
ksiazka('Pan Tadeusz', mickiewicz, poezja).
ksiazka('Byl sobie pies', cameron, przygodowa).
ocena(uzytkownik1, 'W pustyni i w puszczy', 4).
ocena(uzytkownik1, 'Hobbit', 5).
ocena(uzytkownik1, 'Pan Tadeusz', 3).
ocena(uzytkownik1, 'Byl sobie pies', 5).
ocena(uzytkownik2, 'W pustyni i w puszczy', 5).
ocena(uzytkownik2, 'Hobbit', 4).
ocena(uzytkownik2, 'Pan Tadeusz', 2).
ocena(uzytkownik2, 'Byl sobie pies', 4).
ocena(uzytkownik3, 'W pustyni i w puszczy', 3).
ocena(uzytkownik3, 'Hobbit', 1).
ocena(uzytkownik3, 'Pan Tadeusz', 4).
ocena(uzytkownik3, 'Byl sobie pies', 3).
preferencje(uzytkownik1, fantasy).
preferencje(uzytkownik2, przygodowa).
preferencje(uzytkownik3, poezja).
    
zmien_ocene(X,Y,Z) :- ocena(X,Y,_), retract(ocena(X,Y,_)), assertz(ocena(X,Y,Z)), write(ocena(X,Y,Z)).
% ?-zmien_ocene(uzytkownik1, 'Pan Tadeusz', 2) wynik: ocena(uzytkownik1,Pan Tadeusz,2),true


polecane_ksiazki(X,Y) :- preferencje(X,Y), findall(Ksiazka, (ksiazka(Ksiazka, _,Y), ocena(X, Ksiazka, Ocena), Ocena >= 4), Polecane), write(Polecane).
% ?- polecane_ksiazki(uzytkownik2, przygodowa) wynik:[W pustyni i w puszczy, Byl sobie pies],true


%dodatkowe
preferencje_ksiazki(X, Y) :- ocena(X, Y, Z), Z >= 4.

polecane_pozycje(X,Y) :- preferencje_ksiazki(X, Y), findall(Ksiazka, (ksiazka(Ksiazka, _,Y), ocena(X, Ksiazka, Ocena), Ocena >= 4), Polecane), write(Polecane). 
% ?- polecane_pozycje(uzytkownik1, Y) wynik: Y = 'W pustyni i w puszczy', Y = 'Hobbit', Y = 'Byl sobie pies'



