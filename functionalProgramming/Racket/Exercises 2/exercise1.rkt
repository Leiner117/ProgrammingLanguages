;lista de productos
(define
  ListaProductos
  '(("Arroz" 8 1800)
    ("Frijoles" 5 1200)
    ("Azucar" 6 1100)
    ("cafe" 2 2800)
    ("leche" 9 1200)))

(define (agregarProducto lista nombre cantidad precio)
  (cond ((null? lista)
         (list(list nombre cantidad precio)))
        ((equal? nombre (caar lista))
         (cons (list (caar lista)
                     (+(cadar lista) cantidad)
                     precio)
               (cdr lista)))
               
               
         (else
          (cons (car lista ) (agregarProducto (cdr lista) nombre cantidad precio)))))

(define (venderProducto lista nombre cantidad)
  (cond ((null? lista)
         (display "No existe ese producto vender")
         '())
        ((equal? nombre (caar  lista))
         (cons (list
                (caar lista)
                (- (list-ref (car lista) 1) cantidad)
                (list-ref (car lista) 2))
               (cdr lista)))
        (else
         (cons (car lista)
               (venderProducto (cdr lista) nombre cantidad)
               ))))
         


;;Ejercicios de repositorio

;; Función calcularImpuestos: Calcula el total de impuestos a pagar en una factura, 
;; aplicando un impuesto del 13% sobre el monto de los productos cuyo precio unitario
;; supera un umbral especificado.
;;
;; Parámetros:
;; - factura: Lista de productos con sus respectivos precios.
;; - umbral: Umbral sobre el cual se aplicará el impuesto.
;;
;; La función calcula el impuesto para cada producto en la factura usando la función 
;; lambda definida en el map. Si el precio de un producto excede el umbral, se calcula 
;; el impuesto como el 13% del precio del producto multiplicado por la cantidad. Luego,
;; se suma el total de impuestos calculados.
(define (calcularImpuestos factura umbral) 
  (apply + 
    (map (lambda (producto)
           (if (> (caddr producto) umbral)
               (* 0.13 (* (cadr producto) (caddr producto)))
               0))
         factura)))


;; Función calcularTotalSinImpuestos: Calcula el monto total de una factura sin incluir impuestos.
;;
;; Parámetros:
;; - factura: Lista de productos con sus respectivos precios.
;;
;; La función multiplica la cantidad de cada producto por su precio unitario y luego 
;; suma estos montos para obtener el monto total de la factura sin impuestos.
(define (calcularTotalSinImpuestos factura)
  (apply + (map (lambda (producto)
                  (* (cadr producto) (caddr producto)))
                factura)))

;; Ejemplos:
(define factura
  '(("Arroz" 2 1800)
    ("Frijoles" 3 1200)
    ("Azucar" 1 1100)
    ("Cafe" 2 2800)
    ("Leche" 1 1200)))
(displayln "Ejemplo 1")
(display "Impuesto total a cancelar de la factura: ")
(displayln (calcularImpuestos factura 1500))

(display "Monto total de la factura sin impuesto: ")
(displayln (calcularTotalSinImpuestos factura))

(displayln "\nEjemplo 2")
(define factura2
  '(("Arroz" 5 1800)
    ("Frijoles" 5 1600)
    ("Azucar" 3 1100)
    ("Cafe" 2 2800)
    ("Leche" 1 1200)))

(display "Impuesto total a cancelar de la factura: ")
(displayln (calcularImpuestos factura2 1050))

(display "Monto total de la factura sin impuesto: ")
(displayln (calcularTotalSinImpuestos factura2))

(displayln "\nEjemplo 3")
(define factura2
  '(("Arroz" 2 1600)
    ("Frijoles" 1 1870)
    ("Azucar" 3 1300)
    ("Cafe" 10 2000)
    ("Leche" 7 1900)))

(display "Impuesto total a cancelar de la factura: ")
(displayln (calcularImpuestos factura2 500))

(display "Monto total de la factura sin impuesto: ")
(displayln (calcularTotalSinImpuestos factura2))


