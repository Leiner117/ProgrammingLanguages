class EventoFactory extends AbstractFactory {
    @Override
    public Evento crearEvento(String tipo, String nombre, String fecha, String lugar, String... args) {
        switch (tipo) {
            case "deportivo":
                return new EventoDeportivo(nombre, fecha, lugar, args[0]);
            case "cultural":
                return new EventoCultural(nombre, fecha, lugar, args[0]);
            default:
                return new Evento(nombre, fecha, lugar);
        }
    }
    @Override
    public Contacto crearContacto(String tipo, Persona persona, String... args) {
        throw new UnsupportedOperationException("Este método no está implementado para EventoFactory");
    }
}
