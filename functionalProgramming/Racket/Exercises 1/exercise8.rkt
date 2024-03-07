; ejercicio 8
;Funcion sub-conjunto?: recibe dos listas y retorna un valor booleano(true) si la primera lista es subconjunto de la segunda
;Primero la funcion verifica si la lista uno esta vacia
;Si lo anterior es falso se verifica que el primer valor de la lista 1 este en la lista 2
;Si lo anterior es verdadero se llama recursivamente la funcion elimando el primer valor de la lista

(define (sub-conjunto? list1 list2)
  (cond
    ((null? list1) #t) 
    ((member (car list1) list2) 
     (sub-conjunto? (cdr list1) list2))
    (else #f))) 


; ejemplos del ejercicio
(display (sub-conjunto? '() '(a b c d e f))) (newline)
(display (sub-conjunto? '(a b c) '(a b c d e f))) (newline) 
(display (sub-conjunto? '(a b x) '(a b c d e f))) 
