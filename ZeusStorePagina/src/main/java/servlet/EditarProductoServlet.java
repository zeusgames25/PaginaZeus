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

/**
 * Servlet implementation class EditarProductoServlet
 */
public class EditarProductoServlet extends HttpServlet {
	  private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String idproducto = request.getParameter("idproducto");
	        String nombre = request.getParameter("nombre");
	        String descripcion = request.getParameter("descripcion");
	        float precio = Float.parseFloat(request.getParameter("precio"));
	        int stock = Integer.parseInt(request.getParameter("stock"));
	        String imagen = request.getParameter("imagen");
	        String url = "jdbc:mysql://localhost:3306/zeusstore";
	        String user = "root";
	        String password = "123456";

	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url, user, password);
	            String query = "UPDATE producto SET nombre = ?, descripcion = ?, precio = ?, stock = ?, imagen = ? WHERE idproducto = ?";
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, nombre);
	            pstmt.setString(2, descripcion);
	            pstmt.setFloat(3, precio);
	            pstmt.setInt(4, stock);
	            pstmt.setString(5, imagen);
	            pstmt.setString(6, idproducto);
	            pstmt.executeUpdate();
	            
	            response.sendRedirect("listarproductos.jsp"); // Redirigir a la página principal
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
	            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
	        }
	    }
	}