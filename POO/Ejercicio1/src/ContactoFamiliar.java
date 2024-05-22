public class ContactoFamiliar extends Contacto{
    private String parentesco;

    public ContactoFamiliar(Persona persona, String parentesco) {
        super(persona);
        this.parentesco = parentesco;
    }

    @Override
    public String toString() {
        return "Familiar: " + persona + ", Parentesco: " + parentesco;
    }
}
