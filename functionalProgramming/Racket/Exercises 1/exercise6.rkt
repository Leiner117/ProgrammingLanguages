;ejercicio2
;funcion merge: recibe 2 listas ordenadas y devuelve una lista con todos los elementos ordenados
;Primero la funcion se encarga de verificar si alguna lista esta vacia
;despues verifica cual es el primer valor menor de las listas
;agarra el primer valor de la lista que es menor y llama recursivamente la funcion con la lista menos el primer valor
(define (merge list1 list2)
  (cond
    ((null? list1) list2)
    ((null? list2) list1)
    ((< (car list1) (car list2))
     (cons (car list1) (merge (cdr list1) list2)))
    (else
     (cons (car list2) (merge list1 (cdr list2))))))


; ejemplos del ejercicio
(display (merge '(1 2 3 4) '(5 6 7 8))) (newline)
(display (merge '(1 2 3) '(1 2 3 4)))