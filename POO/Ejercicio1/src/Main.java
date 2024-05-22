import java.util.List;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {
        Agenda agenda = getAgenda();

        System.out.println("Agenda Inicial:");
        System.out.println(agenda);

        // Filtrar contactos y eventos
        List<Object> elementos = agenda.getElementos();
        List<Contacto> contactos = elementos.stream()
                .filter(e -> e instanceof Contacto)
                .map(e -> (Contacto) e)
                .toList();

        List<Evento> eventos = elementos.stream()
                .filter(e -> e instanceof Evento)
                .map(e -> (Evento) e)
                .toList();

        System.out.println("\nContactos:");
        contactos.forEach(System.out::println);

        System.out.println("\nEventos:");
        eventos.forEach(System.out::println);
    }

    private static Agenda getAgenda() {
        Agenda agenda = Agenda.getInstance();

        Persona persona1 = new Persona("Tania", "Alvarado", "123456789", "tania@example.com");
        Persona persona2 = new Persona("Steven", "Chacon", "987654321", "Steven@example.com");

        AbstractFactory contactoFactory = new ContactoFactory();
        AbstractFactory eventoFactory = new EventoFactory();

        Contacto contactoFamiliar = contactoFactory.crearContacto("familiar", persona1, "Hermana");
        Contacto contactoEmpresarial = contactoFactory.crearContacto("empresarial", persona2, "TEC", "Estudiante");
        Evento eventoDeportivo = eventoFactory.crearEvento("deportivo", "Partido de Futbol", "2024-06-15", "Estadio Nacional", "Futbol");
        Evento eventoCultural = eventoFactory.crearEvento("cultural", "Concierto", "2024-07-20", "Auditorio", "Musica");

        agenda.agregarElemento(contactoFamiliar);
        agenda.agregarElemento(contactoEmpresarial);
        agenda.agregarElemento(eventoDeportivo);
        agenda.agregarElemento(eventoCultural);
        return agenda;
    }
}