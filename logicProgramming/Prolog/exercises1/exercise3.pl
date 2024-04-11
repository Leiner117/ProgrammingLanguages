% Funcion para calcular la distancia de Hamming entre dos cadenas
distanciaH(Cadena1, Cadena2, Distancia) :-
    atom_chars(Cadena1, ListaChars1),  % Convertir Cadena1 en lista de caracteres
    atom_chars(Cadena2, ListaChars2),  % Convertir Cadena2 en lista de caracteres
    calcularDistancia(ListaChars1, ListaChars2, Distancia).  % Llamar al predicado auxiliar

% Caso base: ambas listas están vacías
calcularDistancia([], [], 0).

% Caso 1: la primera lista está vacía pero la segunda no
calcularDistancia([], [_ | _], 0) :- !.

% Caso 2: la segunda lista está vacía pero la primera no
calcularDistancia([_ | _], [], 0) :- !.

% Comparar los primeros caracteres de ambas listas
calcularDistancia([Char1 | Tail1], [Char1 | Tail2], Distancia) :-
    % Si los caracteres son iguales, continuar comparando el resto de las listas
    calcularDistancia(Tail1, Tail2, Distancia).

calcularDistancia([_ | Tail1], [_ | Tail2], Distancia) :-
    % Si los caracteres son diferentes, incrementar la distancia y continuar comparando
    calcularDistancia(Tail1, Tail2, NewDistancia),
    Distancia is NewDistancia + 1.

% Example usage:
% distanciaH("romano","comino",X). => X = 2
% distanciaH("romano","camino",X). => X = 3
% distanciaH("roma","comino",X). => X = 2
% distanciaH("romano","ron",X). => X = 1
% distanciaH("romano","cama",X). => X = 2