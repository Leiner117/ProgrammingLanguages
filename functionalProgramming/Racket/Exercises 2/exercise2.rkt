;;filtrar-subcadenas: Filtra las cadenas que contienen la subcadena dada.
;; Parámetros:
;; - subcadena: La subcadena que se busca en las cadenas de la lista.
;; - lista-cadenas: Lista de cadenas en las que se busca la subcadena.
;; La función utiliza la función lambda dentro de filter para determinar si cada
;; cadena de la lista contiene la subcadena proporcionada. Se emplea la función 
;; regexp-match? con una expresión regular creada a partir de la subcadena 
;; para realizar la búsqueda. Devuelve una lista de cadenas que contienen la 
;; subcadena dada.
(define (filtrar-subcadenas subcadena lista-cadenas)
  (filter (lambda (cadena) 
            (regexp-match? (regexp (regexp-quote subcadena)) cadena))
          lista-cadenas))


;; Ejemplos
(displayln "Ejemplo 1 ")
(displayln (filtrar-subcadenas "perro" '("Que bonito perro" "el perro se durmio" "Necesito estudiar")))

(displayln "Ejemplo 2 ")
(displayln (filtrar-subcadenas "la" '("la casa" "el perro" "pintando la cerca")))

