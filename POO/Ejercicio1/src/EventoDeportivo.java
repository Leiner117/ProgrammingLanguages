public class EventoDeportivo extends Evento {
    private String deporte;

    public EventoDeportivo(String nombre, String fecha, String lugar, String deporte) {
        super(nombre, fecha, lugar);
        this.deporte = deporte;
    }

    @Override
    public String toString() {
        return "Evento Deportivo: " + nombre + ", Deporte: " + deporte + ", Fecha: " + fecha + ", Lugar: " + lugar;
    }
}