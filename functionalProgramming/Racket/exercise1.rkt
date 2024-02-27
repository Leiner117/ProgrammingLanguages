;;Ejercicio 1
;;Funcion result: calcula el monto que se recibe al depositar un capital a un interes dado en un tiempo especifico 
;;Parametros
;;cap = capital
;;i = interes
;;n = años solicitados
;;La funcion realiza el calculo solicitado usando la formula cap x (1+i )^n y utilizando una llamada recursiva
(define (result cap i n)
  ;cap x (1+i )^n
  (cond[(= n 0) cap]
       (else (result (* cap (+ 1 i)) i (- n 1)))
       )
  )

;Ejemplos del ejercicio
(display (result 2000 0.10 0))(newline)
(display (result 2000 0.10 1))(newline)
(display (result 2000 0.10 2))(newline)
(display (result 2000 0.10 3))(newline)