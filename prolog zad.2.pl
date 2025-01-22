lotnisko(warszawa).
lotnisko(krakow).
lotnisko(gdansk).
lotnisko(lublin).
lotnisko(radom).
polaczenie(warszawa, krakow, 300).
polaczenie(krakow, gdansk, 200).
polaczenie(warszawa, gdansk, 500).
polaczenie(lublin, warszawa, 350).
polaczenie(gdansk, lublin, 400).
polaczenie(radom, lublin, 700). 
polaczenie(radom, gdansk, 250).

polaczenie(X, Y) :- polaczenie(X,Y,_), !.
% ?- polaczenie(warszawa, krakow) wynik:true, ?- polaczenie(kraow, warszawa) wynik:false

koszt_podrozy(X, Y, C) :- polaczenie(X,Y,C), !. 
% ?- koszt_podrozy(warszawa, gdansk, C) wynik: C=500

%droga/4 ---> droga(X,Y,trasa,koszt)
droga(X, Y, [X, Y], C) :- polaczenie(X, Y, C). 
droga(X, Y, [X|Trasa], C) :- polaczenie(X, Z, A), Z \= Y, droga(Z, Y, Trasa, B), C is A + B.
wszystkie_drogi(X,Y) :- droga(X,Y,Trasa,C), format('Czas: ~w, Trasa: ~w~n', [C, Trasa]).
% ?- wszystkie_drogi(radom, lublin) wynik: Czas: 700, Trasa: [radom,lublin],true, Czas: 650, Trasa: [radom,gdansk,lublin]

najkrotsza_droga(X, Y) :- setof(Koszt-Trasa, droga(X, Y, Trasa, Koszt), Lista), Lista = [MinKoszt - NajTrasa | _], format('Koszt: ~w, Trasa: ~w~n', [MinKoszt, NajTrasa]).     
% ?- najkrotsza_droga(radom, lublin) wynik: Koszt: 650, Trasa: [radom,gdansk,lublin], true











    
