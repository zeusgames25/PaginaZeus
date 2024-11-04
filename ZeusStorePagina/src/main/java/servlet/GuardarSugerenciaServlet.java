package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/guardarSugerencia") // Mapeo del servlet
public class GuardarSugerenciaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los datos del formulario
        String nombreusuario = request.getParameter("nombreusuario");
        String correo = request.getParameter("correo");
        String mensaje = request.getParameter("mensaje");
        Integer idusuario = (Integer) request.getSession().getAttribute("idcliente");

        // Verificar que el ID de usuario esté disponible
        if (idusuario == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "No estás autorizado a enviar sugerencias.");
            return;
        }

        // Conectar a la base de datos
        String url = "jdbc:mysql://localhost:3306/zeusstore"; // Cambia la URL de la base de datos
        String user = "root"; // Cambia el usuario
        String password = "123456"; // Cambia la contraseña

        boolean isSuccess = false; // Variable para controlar el éxito de la inserción

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            if (conn != null) {
                System.out.println("Conexión exitosa a la base de datos.");
            }

            String sql = "INSERT INTO sugerencias (idusuario, nombreusuario, correo, mensaje) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, idusuario);
                pstmt.setString(2, nombreusuario);
                pstmt.setString(3, correo);
                pstmt.setString(4, mensaje);

                int rowsAffected = pstmt.executeUpdate();
                isSuccess = (rowsAffected > 0); // Se establece si la inserción fue exitosa
            }
        } catch (SQLException e) {
            e.printStackTrace();
            isSuccess = false; // Si hay un error, se marca como no exitoso
        }

        // Establecer el atributo success según el resultado de la inserción
        if (isSuccess) {
            request.setAttribute("success", "true");
            request.setAttribute("message", "Sugerencia enviada con éxito.");
        } else {
            request.setAttribute("success", "false");
            request.setAttribute("message", "Error al enviar la sugerencia. Intenta nuevamente.");
        }

        // Redireccionar a contactousuario.jsp
        request.getRequestDispatcher("contactousuario.jsp").forward(request, response);
    }
}
