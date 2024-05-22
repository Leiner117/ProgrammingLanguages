public class Evento {
    protected String nombre;
    protected String fecha;
    protected String lugar;

    public Evento(String nombre, String fecha, String lugar) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.lugar = lugar;
    }

    @Override
    public String toString() {
        return "Evento: " + nombre + ", Fecha: " + fecha + ", Lugar: " + lugar;
    }
}
