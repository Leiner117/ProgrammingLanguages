;Ejercicio 9
;Funcion eliminar_elemento: elimina todos los valores e de la lista l
;Parametros
;e = elemento que se desea borrar
;l = lista
;El map se encarga de aplicarle una funcion lambda que se encarga de verificar los valores iguales, si hay un valor igual retorna una lista vacia
;la funcion filter se encarga de borrar las listas vacias 
(define (eliminar_elemento e l)
  (filter (lambda (x) (not (null? x))) 
          (map (lambda (n) (if (equal? n e) '() n)) l)))

(display (eliminar_elemento 3 '(1 2 3 4 5))) (newline);
(display (eliminar_elemento 5 '(1 2 3 4 5)))