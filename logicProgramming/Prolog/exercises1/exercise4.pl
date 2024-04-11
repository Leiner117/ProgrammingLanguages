% Hechos: definición de categorías de platos y sus calorías
entrada(guacamole, 200).
entrada(ensalada, 150).
entrada(consome, 300).
entrada(tostadas_caprese, 250).

plato_principal(filete_de_cerdo, 400).
plato_principal(pollo_al_horno, 280).
plato_principal(carne_en_salsa, 320).
plato_principal(tilapia, 160).
plato_principal(salmon, 300).
plato_principal(trucha, 225).

postre(flan, 200).
postre(nueces_con_miel, 500).
postre(naranja_confitada, 450).
postre(flan_de_coco, 375).

% Regla para determinar el valor calórico de una comida completa
calorias_comida(Entrada, Principal, Postre, CaloriasTotales) :-
    entrada(Entrada, CalEntrada),
    plato_principal(Principal, CalPrincipal),
    postre(Postre, CalPostre),
    CaloriasTotales is CalEntrada + CalPrincipal + CalPostre.

% Regla para verificar si una comida completa no contiene elementos repetidos
comida_sin_repetidos(Entrada, Principal, Postre) :-
    Entrada \= Principal, Entrada \= Postre, Principal \= Postre.

% Regla para generar combinaciones de comidas que no superen un máximo de calorías
generar_combinaciones(MaxCalorias, Combinaciones) :-
    findall((E, P, Po, Cal),
            (entrada(E, _), plato_principal(P, _), postre(Po, _),
             calorias_comida(E, P, Po, Cal), Cal =< MaxCalorias,
             comida_sin_repetidos(E, P, Po)),
            TodasCombinaciones),
    length(Combinaciones, 5),
    append(Combinaciones, _, TodasCombinaciones).

% Consulta para obtener las primeras 5 combinaciones que cumplen con las restricciones de calorías
obtener_combinaciones(Calorias, Combinaciones) :-
    generar_combinaciones(Calorias, Combinaciones).

% Ejemplo de uso:
% Consulta obtener_combinaciones(800, Combinaciones).
