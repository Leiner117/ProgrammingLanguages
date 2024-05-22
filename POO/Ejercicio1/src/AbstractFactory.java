// Abstract Factory para crear Contactos y Eventos

/**
 * Abstract Factory: Este patrón nos permite crear familias de objetos relacionados sin especificar sus clases concretas.
 * Es útil aquí para crear diferentes tipos de contactos y eventos sin modificar el código de la clase principal.
 */
public abstract class AbstractFactory {
    public abstract Contacto crearContacto(String tipo, Persona persona, String... args);

    public abstract Evento crearEvento(String tipo, String nombre, String fecha, String lugar, String... args);
}
