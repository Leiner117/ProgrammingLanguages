public class ContactoFactory extends AbstractFactory {
    @Override
    public Contacto crearContacto(String tipo, Persona persona, String... args) {
        switch (tipo) {
            case "familiar":
                return new ContactoFamiliar(persona, args[0]);
            case "empresarial":
                return new ContactoEmpresarial(persona, args[0], args[1]);
            default:
                return new Contacto(persona);
        }
    }

    @Override
    public Evento crearEvento(String tipo, String nombre, String fecha, String lugar, String... args) {
        throw new UnsupportedOperationException("Este método no está implementado para ContactoFactory");
    }
}
