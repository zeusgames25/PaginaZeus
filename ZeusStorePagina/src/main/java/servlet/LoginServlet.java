package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.DBConnection;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreusuario = request.getParameter("nombreusuario");
        String contraseña = request.getParameter("contraseña");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
           
            // Establecer la conexión con la base de datos
            con = DBConnection.getConnection();
            // Verificar en la tabla usuario
            String query = "SELECT * FROM administrador WHERE nombreusuario = ? AND contraseña = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, nombreusuario);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Usuario encontrado en la tabla administrador
            	 int idadministrador = rs.getInt("idadministrador");
                 System.out.println("admin encontrado con ID: " + idadministrador);

                 // Almacenar el ID y otros datos en la sesión
                 HttpSession session = request.getSession();
                 session.setAttribute("idadministrador", idadministrador);
                 session.setAttribute("nombres", rs.getString("nombres"));
                 session.setAttribute("apellidos", rs.getString("apellidos"));
                 session.setAttribute("celular", rs.getString("celular"));
                 session.setAttribute("departamento", rs.getString("departamento"));
                 session.setAttribute("direccion", rs.getString("direccion"));
                 session.setAttribute("correo", rs.getString("correo"));
                 session.setAttribute("nombreusuario", rs.getString("nombreusuario"));
                 session.setAttribute("contraseña", rs.getString("contraseña")); 

                response.sendRedirect("listarproductos.jsp");
                return;
            }

            // Verificar en la tabla profesional
            query = "SELECT * FROM cliente WHERE nombreusuario = ? AND contraseña = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, nombreusuario);
            ps.setString(2, contraseña);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Usuario encontrado en la tabla cliente
            	 int idcliente = rs.getInt("idcliente");
                 System.out.println("cliente encontrado con ID: " + idcliente);

                 // Almacenar el ID y otros datos en la sesión
                 HttpSession session = request.getSession();
                 session.setAttribute("idcliente", idcliente);
                 session.setAttribute("nombres", rs.getString("nombres"));
                 session.setAttribute("apellidos", rs.getString("apellidos"));
                 session.setAttribute("celular", rs.getString("celular"));
                 session.setAttribute("fechanacimiento", rs.getString("fechanacimiento"));
                 session.setAttribute("departamento", rs.getString("departamento"));
                 session.setAttribute("direccion", rs.getString("direccion"));
                 session.setAttribute("correo", rs.getString("correo"));
                 session.setAttribute("nombreusuario", rs.getString("nombreusuario"));
                 session.setAttribute("contraseña", rs.getString("contraseña")); 
                 
                response.sendRedirect("homeusuario.jsp");
                return;
            }

            // Si no se encontró en ninguna tabla, establecer el mensaje de error
            request.setAttribute("errorMessage", "Nombre de usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error en la consulta de la base de datos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
