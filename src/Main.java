import com.sena.dao.EquipoDAO;
import com.sena.model.Equipo;

public class Main {
    public static void main(String[] args) {
        // Instancia del DAO para la base de datos sena_db
        EquipoDAO dao = new EquipoDAO();
        
        // Creación de un objeto neutro para la evidencia
        Equipo eq = new Equipo();
        eq.setNombre("Equipo de Computo 01");
        eq.setMarca("Marca Generica");
        eq.setEstado("Disponible");

        System.out.println("Iniciando registro en la base de datos SENA...");
        
        // Ejecución del método de inserción
        dao.crear(eq);
        
        System.out.println("-------------------------------------------");
        System.out.println("¡EXITO! El registro se guardo correctamente.");
        System.out.println("Verifique en phpMyAdmin: sena_db > equipos");
        System.out.println("-------------------------------------------");
    }
}