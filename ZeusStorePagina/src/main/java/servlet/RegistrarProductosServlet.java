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
 * Servlet implementation class RegistrarProductosServlet
 */
public class RegistrarProductosServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Parámetros del formulario
	        String nombre = request.getParameter("nombre");
	        String descripcion = request.getParameter("descripcion");
	        float precio = Float.parseFloat(request.getParameter("precio"));
	        int stock = Integer.parseInt(request.getParameter("stock"));
	        String imagen = request.getParameter("imagen");
	        
	        // Conexión a la base de datos
	        String url = "jdbc:mysql://localhost:3306/zeusstore";
	        String user = "root";
	        String password = "123456";

	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url, user, password);
	            
	            String sql = "INSERT INTO producto (nombre, descripcion, precio, stock, imagen) VALUES (?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, nombre);
	            pstmt.setString(2, descripcion);
	            pstmt.setFloat(3, precio);
	            pstmt.setInt(4, stock);
	            pstmt.setString(5, imagen);

	            pstmt.executeUpdate();
	            
	            response.sendRedirect("listarproductos.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al registrar el producto.");
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
	            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
	        }
	    }
	}
