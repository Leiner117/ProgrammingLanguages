% funcion para verificar si un elemento está contenido en una lista
% Pertenece(X, Lista) es verdadero si X está en Lista
pertenece(X, [X|_]).
pertenece(X, [_|Resto]) :-
    pertenece(X, Resto).

% funcion para verificar si todos los elementos de la primera lista están en la segunda lista
% TodosEnLista(Lista1, Lista2) es verdadero si todos los elementos de Lista1 están en Lista2
todos_en_lista([], _).
todos_en_lista([X|Xs], Lista) :-
    pertenece(X, Lista),
    todos_en_lista(Xs, Lista).

% funcion principal para verificar si Lista1 es un subconjunto completo de Lista2
% SubConjuntoCompleto(Lista1, Lista2) es verdadero si Lista1 es un subconjunto completo de Lista2
sub_conjunto([], _).
sub_conjunto([X|Xs], Lista) :-
    pertenece(X, Lista),
    sub_conjunto(Xs, Lista).

% Ejemplo de consultas:
% sub_conjunto([], [1,2,3,4,5]).
% sub_conjunto([1,2,3], [1,2,3,4,5]).
% sub_conjunto([1,2,6], [1,2,3,4,5]).
