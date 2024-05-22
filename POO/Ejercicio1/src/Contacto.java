public class Contacto {
    protected Persona persona;

    public Contacto(Persona persona) {
        this.persona = persona;
    }

    @Override
    public String toString() {
        return "Contacto: " + persona;
    }
}
