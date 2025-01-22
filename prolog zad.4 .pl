miasto(warszawa).
miasto(krakow).
miasto(poznan).
miasto(otwock).
miasto(szczecin).
droga(warszawa, krakow, 4).
droga(krakow, poznan, 2).
droga(warszawa, poznan, 7).
droga(otwock, szczecin, 10).
droga(warszawa, otwock, 2).

droga(X, Y) :- droga(X,Y,_), !.
%?- droga(warszawa, krakow) wynik:true ?- droga(warszawa, szczecin) wynik:false

czas_przejazdu(X, Y, [X, Y], C) :- droga(X, Y, C). 
czas_przejazdu(X, Y, [X|Trasa], C) :- droga(X, Z, A), Z \= Y, czas_przejazdu(Z, Y, Trasa, B), C is A + B.
czas_przejazdu(X,Y) :- czas_przejazdu(X,Y,Trasa,C), format('Czas: ~w, Trasa: ~w~n', [C, Trasa]).
% ?- czas_przejazdu(warszawa,poznan) wynik:Czas: 7, Trasa: [warszawa,poznan]true, Czas: 6, Trasa: [warszawa,krakow,poznan]true
najkrotsza_trasa(X, Y) :- findall([Czas, Trasa], czas_przejazdu(X, Y, Czas, Trasa), Trasy), sort(Trasy, [[NajkrotszyCzas, NajkrotszaTrasa] | _]), format('Najkrótszy czas: ~w, Trasa: ~w~n', [NajkrotszaTrasa, NajkrotszyCzas]).
% ?- najkrotsza_trasa(warszawa,poznan) wynik: Najkrótszy czas: 6, Trasa: [warszawa,krakow,poznan)true




