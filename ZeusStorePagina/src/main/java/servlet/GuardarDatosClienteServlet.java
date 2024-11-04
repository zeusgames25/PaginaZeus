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

/**
 * Servlet implementation class GuardarDatosClienteServlet
 */
public class GuardarDatosClienteServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;
      
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String nombres = request.getParameter("nombres");
	        String apellidos = request.getParameter("apellidos");
	        String celular = request.getParameter("celular");
	        String fechanacimiento = request.getParameter("fechanacimiento");
	        String departamento = request.getParameter("departamento");
	        String direccion = request.getParameter("direccion");
	        String correo = request.getParameter("correo");
	        String nombreusuario = request.getParameter("nombreusuario");
	        String contraseña = request.getParameter("contraseña");
	        Connection con = null;
	        PreparedStatement ps = null;

	        try {
	            // 1. Cargar el Driver MySQL
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // 2. Establecer la conexión con la base de datos
	            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zeusstore","root","123456");

	            // 3. Crear el statement para la consulta SQL
	            String query = "INSERT INTO cliente (nombres,apellidos,celular,fechanacimiento,departamento,direccion,correo,nombreusuario,contraseña) VALUES (?, ?, ?, ?, ?, ?,?,?,?)";
	            ps = con.prepareStatement(query);

	            // 4. Asignar los valores a los placeholders
	            ps.setString(1, nombres);
	            ps.setString(2, apellidos);
	            ps.setString(3, celular);
	            ps.setString(4, fechanacimiento);
	            ps.setString(5, departamento);
	            ps.setString(6, direccion);
	            ps.setString(7, correo);
	            ps.setString(8, nombreusuario);
	            ps.setString(9, contraseña);

	            // 5. Ejecutar la consulta
	            int rowsInserted = ps.executeUpdate();

	            // 6. Verificar si se insertaron los datos
	            if (rowsInserted > 0) {
	                System.out.println("Datos guardados exitosamente.");
	            }

	            // Redirigir al usuario a la página de listado
	            response.sendRedirect("index.jsp");

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