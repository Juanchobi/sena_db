package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// El servicio web se mapea a esta URL
@WebServlet("/api/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Configuramos la respuesta como JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // Recibimos los parámetros (Usuario y Contraseña)
        String user = request.getParameter("usuario");
        String pass = request.getParameter("password");

        // COMENTARIO: Lógica de autenticación
        // Aquí validamos si los datos coinciden con lo que pide la guía
        if ("admin".equals(user) && "12345".equals(pass)) {
            // Respuesta exitosa
            out.print("{\"mensaje\": \"Autenticación satisfactoria\", \"status\": 200}");
        } else {
            // Respuesta de error
            out.print("{\"mensaje\": \"Error en la autenticación\", \"status\": 401}");
        }
    }
}