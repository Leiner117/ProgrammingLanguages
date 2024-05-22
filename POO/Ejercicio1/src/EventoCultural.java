public class EventoCultural extends Evento {
    private String tipo;

    public EventoCultural(String nombre, String fecha, String lugar, String tipo) {
        super(nombre, fecha, lugar);
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Evento Cultural: " + nombre + ", Tipo: " + tipo + ", Fecha: " + fecha + ", Lugar: " + lugar;
    }
}