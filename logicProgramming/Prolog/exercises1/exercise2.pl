% Caso base: aplanar una lista vacía devuelve una lista vacía
aplanar([], []).

% Caso cuando el primer elemento no es una lista
aplanar([Head|Tail], [Head|FlattenedTail]) :-
    \+ es_lista(Head), % Verificar si Head no es una lista
    aplanar(Tail, FlattenedTail).

% Caso cuando el primer elemento es una lista
aplanar([Head|Tail], FlattenedList) :-
    es_lista(Head), % Verificar si Head es una lista
    aplanar(Head, FlattenedHead), % Aplanar la lista Head recursivamente
    aplanar(Tail, FlattenedTail), % Aplanar el resto de la lista recursivamente
    concatenar(FlattenedHead, FlattenedTail, FlattenedList). % Concatenar las listas aplanadas

% funcion para verificar si un término es una lista
es_lista([]). % Una lista vacía es una lista
es_lista([_|_]). % Una lista no vacía es una lista

% funcion para concatenar dos listas
concatenar([], L, L). % Concatenar una lista vacía con L devuelve L
concatenar([X|L1], L2, [X|L3]) :- % Concatenar una lista no vacía [X|L1] con L2 produce [X|L3]
    concatenar(L1, L2, L3).

% Ejemplo de uso:
% aplanar([1,2,[3,[4,5],[6,7]]], X).
% Resultado esperado: X = [1,2,3,4,5,6,7].
