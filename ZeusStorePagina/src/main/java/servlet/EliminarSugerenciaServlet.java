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

import DB.DBConnection;

public class EliminarSugerenciaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Configuración de conexión a la base de datos

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idsugerencias = request.getParameter("idsugerencias");
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
        	conn = DBConnection.getConnection();
            // Conectar a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Preparar la sentencia SQL para eliminar la sugerencia
            String sql = "DELETE FROM sugerencias WHERE idsugerencias = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idsugerencias);

            // Ejecutar la eliminación
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Sugerencia eliminada exitosamente.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Redirigir de vuelta a la página de sugerencias
        response.sendRedirect("sugerencias.jsp");
    }
}

