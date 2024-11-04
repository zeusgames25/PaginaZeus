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

import com.mysql.cj.protocol.Resultset;

/**
 * Servlet implementation class EliminarDatosCita
 */
public class EliminarDatosServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idproducto = request.getParameter("idproducto");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // 1. Cargar el Driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Establecer la conexión con la base de datos
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zeusstore", "root", "123456");

            // 3. Crear el statement para la consulta SQL
            String query = "DELETE FROM producto WHERE idproducto = ?";
            ps = con.prepareStatement(query);

            // 4. Asignar el valor al placeholder
            ps.setString(1, idproducto);

            // 5. Ejecutar la consulta
            int rowsDeleted = ps.executeUpdate();

            // 6. Verificar si se eliminaron los datos
            if (rowsDeleted > 0) {
                System.out.println("Producto eliminado exitosamente.");
            } else {
                System.out.println("No se encontró ninguna cita con el ID proporcionado.");
            }

            // Redirigir al usuario a la página de listado
            response.sendRedirect("listarproductos.jsp");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
        } finally {
            // 7. Cerrar recursos
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
