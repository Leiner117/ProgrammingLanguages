import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Eager Singleton: La instancia se crea en el momento en que se carga la clase. Esto es útil si el objeto es liviano y se va a utilizar frecuentemente, ya que asegura que la instancia esté disponible inmediatamente.
 * Lazy Singleton: La instancia se crea la primera vez que se necesita. Esto es útil si la creación del objeto es costosa o si el objeto puede no ser usado, para evitar un desperdicio de recursos.
 * En este caso, usamos un Lazy Singleton porque la creación de la agenda podría no ser inmediata y queremos optimizar el uso de recursos solo cuando realmente sea necesario.
 */
public class Agenda {
    private static Agenda instance;
    private List<Object> elementos;

    private Agenda() {
        elementos = new ArrayList<>();
    }

    public static synchronized Agenda getInstance() {
        if (instance == null) {
            instance = new Agenda();
        }
        return instance;
    }

    public void agregarElemento(Object elemento) {
        elementos.add(elemento);
    }

    public void eliminarElemento(Object elemento) {
        elementos.remove(elemento);
    }

    public void modificarElemento(Object oldElemento, Object newElemento) {
        int index = elementos.indexOf(oldElemento);
        if (index != -1) {
            elementos.set(index, newElemento);
        }
    }

    @Override
    public String toString() {
        return elementos.stream()
                .map(Object::toString)
                .collect(Collectors.joining("\n"));
    }

    public List<Object> getElementos() {
        return elementos;
    }
}