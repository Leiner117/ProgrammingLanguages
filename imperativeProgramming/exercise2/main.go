package main

import (
	"fmt"
	"sort"
	"strings"
)

// Definición de la estructura infoCliente que representa la información de un cliente.
type infoCliente struct {
	nombre string
	correo string
	edad   int32
}

// Definición de listaClientes, un tipo de slice de infoCliente.
type listaClientes []infoCliente

// Función agregarCliente agrega un nuevo cliente a la lista de clientes.
func (lc *listaClientes) agregarCliente(nombre, correo string, edad int32) {
	*lc = append(*lc, infoCliente{nombre, correo, edad})
}

// Función filter filtra una lista de elementos basado en una función de filtro.
func filter[T any](list []T, f func(T) bool) []T {
	filtered := make([]T, 0)

	for _, element := range list {
		if f(element) {
			filtered = append(filtered, element)
		}
	}
	return filtered
}

// Función map2 mapea una lista de elementos a otro tipo de elementos utilizando una función de mapeo.
func map2[T any, R any](list []T, f func(T) R) []R {
	mapped := make([]R, len(list))

	for i, e := range list {
		mapped[i] = f(e)
	}
	return mapped
}

// Función contieneSubcadena verifica si una cadena contiene una subcadena específica.
func contieneSubcadena(cadena, subcadena string) bool {
	for i := 0; i <= len(cadena)-len(subcadena); i++ {
		if cadena[i:i+len(subcadena)] == subcadena {
			return true
		}
	}
	return false
}

// Función reduce reduce una lista de elementos a un solo valor utilizando una función de reducción.
func reduce[T any, R any](list []T, init R, f func(R, T) R) R {
	result := init

	for _, element := range list {
		result = f(result, element)
	}

	return result
}

// Función listaClientes_ApellidoEnCorreo filtra los clientes cuyos correos contienen un apellido específico.
func listaClientes_ApellidoEnCorreo(lista *listaClientes, apellido string) listaClientes {
	apellido = strings.ToLower(apellido)
	return filter(*lista, func(c infoCliente) bool {
		return contieneSubcadena(strings.ToLower(c.correo), apellido)
	})
}

// Función cantidadCorreosCostaRica cuenta la cantidad de clientes cuyos correos pertenecen a dominios de Costa Rica.
func cantidadCorreosCostaRica(lista *listaClientes) int {
	correosCR := filter(*lista, func(c infoCliente) bool {
		return contieneSubcadena(c.correo, ".cr")
	})

	cantidadCorreos := map2(correosCR, func(c infoCliente) int {
		return 1
	})

	return reduce(cantidadCorreos, 0, func(acc, val int) int {
		return acc + val
	})
}

// Función sugerenciasCorreos genera una sugerencia de correo para un cliente basado en su nombre y correo actual.
func sugerenciasCorreos(nombre, correo string) string {
	parts := strings.Split(correo, "@")
	nombreParts := strings.Split(strings.ToLower(nombre), " ")
	nombreCliente := nombreParts[0]
	if len(nombreCliente) >= 2 {
		nombreCliente = nombreCliente[:2] // Tomar las dos primeras letras del nombre
	}
	apellido := nombreParts[len(nombreParts)-1]
	dominio := parts[1]
	return nombreCliente + apellido + "@" + dominio
}

// Función clientesSugerenciasCorreos genera sugerencias de correos para los clientes cuyos correos no contienen su nombre.
func clientesSugerenciasCorreos(lista *listaClientes) listaClientes {
	return map2(*lista, func(c infoCliente) infoCliente {
		if !strings.Contains(strings.ToLower(c.correo), strings.Replace(strings.ToLower(c.nombre), " ", "", -1)) {
			// Si el correo no contiene el nombre, se cambia por la sugerencia
			return infoCliente{c.nombre, sugerenciasCorreos(c.nombre, c.correo), c.edad}
		}
		// Si el correo ya contiene el nombre, se deja igual
		return c
	})
}

// Función correosOrdenadosAlfabeticos devuelve una lista de correos de clientes ordenados alfabéticamente.
func correosOrdenadosAlfabeticos(lista *listaClientes) []string {
	correos := make([]string, len(*lista))

	// Obtener todos los correos de la lista de clientes
	for i, cliente := range *lista {
		correos[i] = cliente.correo
	}

	// Ordenar los correos alfabéticamente
	sort.Strings(correos)

	return correos
}

func main() {
	var listaClientes listaClientes

	// Insertar clientes
	listaClientes.agregarCliente("Oscar Viquez", "oviquez@tec.ac.cr", 44)
	listaClientes.agregarCliente("Pedro Perez", "elsegundo@gmail.com", 30)
	listaClientes.agregarCliente("Maria Lopez", "mlopez@hotmail.com", 18)
	listaClientes.agregarCliente("Juan Rodriguez", "jrodriguez@gmail.com", 25)
	listaClientes.agregarCliente("Luisa Gonzalez", "muyseguro@tec.ac.cr", 67)
	listaClientes.agregarCliente("Marco Rojas", "loquesea@hotmail.com", 47)
	listaClientes.agregarCliente("Marta Saborio", "msaborio@gmail.com", 33)
	listaClientes.agregarCliente("Camila Segura", "csegura@ice.co.cr", 19)
	listaClientes.agregarCliente("Fernando Rojas", "frojas@estado.gov", 27)
	listaClientes.agregarCliente("Rosa Ramirez", "risuenna@gmail.com", 50)

	//Probar listaClientes_ApellidoEnCorreo
	resultadoFilter := listaClientes_ApellidoEnCorreo(&listaClientes, "Saborio")

	for i, cliente := range resultadoFilter {
		fmt.Printf("%d) Nombre: %s, Correo: %s, Edad: %d\n", i+1, cliente.nombre, cliente.correo, cliente.edad)
	}
	cantidad := cantidadCorreosCostaRica(&listaClientes)
	fmt.Printf("Cantidad de correos de Costa Rica: %d\n", cantidad)

	resultado := clientesSugerenciasCorreos(&listaClientes)

	// Mostrar clientes con correos sugeridos
	fmt.Println("Lista de clientes con correos sugeridos:")
	for i, cliente := range resultado {
		fmt.Printf("%d) Nombre: %s, Correo: %s, Edad: %d\n", i+1, cliente.nombre, cliente.correo, cliente.edad)
	}

	// Mostrar lista de clientes original
	fmt.Println("Lista de clientes original:")
	for i, cliente := range listaClientes {
		fmt.Printf("%d) Nombre: %s, Correo: %s, Edad: %d\n", i+1, cliente.nombre, cliente.correo, cliente.edad)
	}

	// Obtener y mostrar correos ordenados alfabéticamente
	correosOrdenados := correosOrdenadosAlfabeticos(&listaClientes)
	fmt.Println("Correos ordenados alfabéticamente:")
	for _, correo := range correosOrdenados {
		fmt.Println(correo)
	}
}
