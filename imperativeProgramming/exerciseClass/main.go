package main

import "fmt"

// Representa un producto con nombre, cantidad y precio.
type producto struct {
	nombre   string // Nombre del producto
	cantidad int    // Cantidad disponible del producto
	precio   int    // Precio del producto
}

type listaProductos []producto

var lProductos listaProductos

const existenciaMinima int = 10

// agregarProducto agrega un nuevo producto a la lista de productos.
// Si el producto ya existe, incrementa la cantidad y actualiza el precio si es diferente.
func (l *listaProductos) agregarProducto(nombre string, cantidad int, precio int) {
	index, _ := l.buscarProducto(nombre)
	if index != 0 {
		(*l)[index].cantidad += cantidad
		if precio != (*l)[index].precio {
			(*l)[index].precio = precio
		}
	} else {
		*l = append(*l, producto{nombre: nombre, cantidad: cantidad, precio: precio})
	}
}

// agregarProductos agrega múltiples productos a la lista de productos.
func (l *listaProductos) agregarProductos(productos ...producto) {
	for _, p := range productos {
		l.agregarProducto(p.nombre, p.cantidad, p.precio)
	}
}

// buscarProducto busca un producto por su nombre en la lista de productos.
// Retorna el índice del producto si se encuentra, de lo contrario, retorna -1.
func (l *listaProductos) buscarProducto(nombre string) (int, error) {
	for i, p := range *l {
		if p.nombre == nombre {
			return i, nil
		}
	}
	return 0, fmt.Errorf("producto '%s' no encontrado", nombre)
}

// venderProducto vende una cantidad específica del producto dado su nombre.
// Retorna un error si no hay suficiente cantidad del producto.
func (l *listaProductos) venderProducto(nombre string, cantidad int) error {
	prodIndex, err := l.buscarProducto(nombre)
	if err != nil {
		return err
	}
	if (*l)[prodIndex].cantidad < cantidad {
		return fmt.Errorf("no hay suficiente cantidad de '%s' en existencia", nombre)
	}
	(*l)[prodIndex].cantidad -= cantidad
	if (*l)[prodIndex].cantidad == 0 {
		l.eliminarProducto(prodIndex)
	}
	return nil
}

// modificarPrecio modifica el precio de un producto existente por su nombre.
func (l *listaProductos) modificarPrecio(nombre string, nuevoPrecio int) error {
	prodIndex, err := l.buscarProducto(nombre)
	if err != nil {
		return err
	}
	(*l)[prodIndex].precio = nuevoPrecio
	return nil
}

// eliminarProducto elimina un producto de la lista de productos dado su índice.
func (l *listaProductos) eliminarProducto(index int) {
	*l = append((*l)[:index], (*l)[index+1:]...)
}

// listarProductosMinimos retorna una lista de productos que tienen una existencia menor o igual a existenciaMinima.
func (l *listaProductos) listarProductosMinimos() listaProductos {
	var productosMinimos listaProductos
	for _, p := range *l {
		if p.cantidad <= existenciaMinima {
			productosMinimos = append(productosMinimos, p)
		}
	}
	return productosMinimos
}

// llenarDatos inicializa la lista de productos con datos iniciales.
func llenarDatos() {
	lProductos.agregarProducto("arroz", 15, 2500)
	lProductos.agregarProducto("frijoles", 4, 2000)
	lProductos.agregarProducto("leche", 8, 1200)
	lProductos.agregarProducto("café", 12, 4500)
}

func main() {
	// Llenar la lista de productos con datos iniciales
	llenarDatos()
	fmt.Println("Productos antes de la venta:")
	fmt.Println(lProductos)

	// Ejemplo de venta de productos
	err := lProductos.venderProducto("arroz", 5)
	if err != nil {
		fmt.Println("Error en la venta:", err)
	}

	fmt.Println("\nProductos después de la venta:")
	fmt.Println(lProductos)

	// Ejemplo de modificación de precio
	err = lProductos.modificarPrecio("café", 5000)
	if err != nil {
		fmt.Println("Error al modificar precio:", err)
	}

	fmt.Println("\nProductos después de modificar precio:")
	fmt.Println(lProductos)

	// Ejemplo de listar productos mínimos
	fmt.Println("\nProductos con existencia mínima:")
	productosMinimos := lProductos.listarProductosMinimos()
	fmt.Println(productosMinimos)
}
