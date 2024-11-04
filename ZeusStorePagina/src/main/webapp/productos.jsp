<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Productos</title>
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<!-- Estilos personalizados -->
<style>
    .card-img-top {
        width: 100%;
        aspect-ratio: 1 / 1; /* Mantener siempre cuadrado */
        object-fit: cover; /* Asegurar que la imagen no se deforme */
        transition: transform 0.3s ease-in-out; /* Transición suave */
    }

    .card-img-top:hover {
        transform: scale(1.1); /* Zoom suave */
    }
</style>
<div style="background-color: #000000;">
  <div class="text-center py-3">
    <img src="https://i.postimg.cc/kGL7j8sy/portada-fb-final-gytgvg.png" class="img-fluid img-rounded" alt="Logo" width="900" height="250">
  </div>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto">
          <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="nosotros">Nosotros</a></li>
          <li class="nav-item"><a class="nav-link" href="informacion.jsp">Información</a></li>
          <li class="nav-item"><a class="nav-link active" href="productos.jsp">Productos</a></li>
          <li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a></li>
        </ul>

        <form class="d-flex" method="GET" action="productos.jsp">
          <% 
            String search = request.getParameter("search") != null ? request.getParameter("search") : ""; 
          %>
          <input class="form-control me-2" type="search" name="search" placeholder="Buscar" aria-label="Buscar" value="<%= search %>">
          <button class="btn btn-outline-light" type="submit">Buscar</button>
        </form>
        <ul class="navbar-nav ms-3">
          <li class="nav-item"><a class="nav-link" href="registrarcliente.jsp"><i class="bi bi-person-plus"></i> Registrate</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Acceder</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>
</head>

<body>
    <!-- Contenedor del catálogo -->
    <div class="container mt-5">
        <h2 class="mb-4 text-center">Catálogo de Productos</h2>
        <div class="row g-4">

            <%
                // Conexión a la base de datos
                String url = "jdbc:mysql://localhost:3306/zeusstore";
                String user = "root";
                String password = "123456";
                String searchQuery = request.getParameter("search"); // Obtener el valor de búsqueda
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();

                    // Consulta SQL para buscar productos
                    String query = "SELECT * FROM producto";
                    if (searchQuery != null && !searchQuery.isEmpty()) {
                        query += " WHERE nombre LIKE '%" + searchQuery + "%'";
                    }

                    rs = stmt.executeQuery(query);

                    while(rs.next()) {
                        String nombre = rs.getString("nombre");
                        String imagen = rs.getString("imagen"); // URL o nombre del archivo de imagen
                        float precio = rs.getFloat("precio");
            %>

            <!-- Cada tarjeta de producto -->
            <div class="col-lg-4 col-md-6">
                <div class="card h-100">
                    <img src="<%= imagen %>" class="card-img-top" alt="<%= nombre %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= nombre %></h5>
                        <p class="card-text card-text"><strong>Precio:</strong> S/. <%= precio %></p>
                        <a href="login.jsp" class="btn btn-success">Comprar</a>
                    </div>
                </div>
            </div>

            <%
                    } // Cierre del bucle while
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>

        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center mt-5 py-4">
        <h5>Mi Tienda</h5>
        <ul class="list-unstyled d-flex justify-content-center mb-3">
            <li class="mx-3"><a href="#" class="text-white text-decoration-none">Acerca de</a></li>
            <li class="mx-3"><a href="#" class="text-white text-decoration-none">Contacto</a></li>
        </ul>
        <ul class="list-unstyled d-flex justify-content-center mb-3">
            <li class="mx-3"><a href="https://www.facebook.com" target="_blank" class="text-white"><i class="bi bi-facebook"></i></a></li>
            <li class="mx-3"><a href="https://www.twitter.com" target="_blank" class="text-white"><i class="bi bi-twitter"></i></a></li>
            <li class="mx-3"><a href="https://www.instagram.com" target="_blank" class="text-white"><i class="bi bi-instagram"></i></a></li>
        </ul>
        <p class="mb-0">© 2024 Mi Tienda. Todos los derechos reservados.</p>
    </footer>

</body>
</html>
