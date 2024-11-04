<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Evitar acceso a la página después de cerrar sesión
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    response.setDateHeader("Expires", -1);

    // Verificar si la sesión está activa
    if (session.getAttribute("nombreusuario") == null) {
        response.sendRedirect("login.jsp"); // Redirige al login si no hay sesión
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicio de Usuario</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
    
    <!-- Intro.js para la guía -->
    <link href="https://cdn.jsdelivr.net/npm/intro.js/minified/introjs.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/intro.js/minified/intro.min.js"></script>

    <style>
        .contact-section {
            background-color: #f8f9fa;
            padding: 50px 0;
            border-radius: 8px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .user-info img {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }
        .cart-table {
            margin-top: 30px;
        }
        .catalog-section {
            margin-top: 30px;
        }
        .product-card {
            margin: 15px;
        }
         .introjs-tooltip {
        border-radius: 10px; /* Bordes redondeados */
        background-color: #fff; /* Color de fondo blanco */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra para dar profundidad */
        max-width: 300px; /* Ancho máximo del tooltip */
        padding: 15px; /* Espaciado interno */
        text-align: center; /* Centrar texto */
    }

    /* Personaliza el texto dentro del tooltip */
    .introjs-tooltiptext {
        font-size: 14px; /* Tamaño de fuente */
        color: #333; /* Color del texto */
    }

    /* Ajustar la imagen */
    .introjs-tooltip img {
        border-radius: 8px; /* Bordes redondeados en la imagen */
        margin: 10px 0; /* Margen alrededor de la imagen */
        width: 100%; /* Ancho completo */
        height: auto; /* Altura automática para mantener la proporción */
    }
        /* Estilo para el botón flotante */
.btn-flotante {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 1000;
    background-color: #000000;
     border-radius: 50%;
    width: 80px;
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.img-flotante {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Asegura que la imagen se ajuste bien al tamaño del botón */
    border-radius: 50%;
}

    </style>
    
  <script>
    // Función para iniciar la guía
    function iniciarGuia() {
        introJs().setOptions({
            steps: [
                {
                    intro: "<h3>Bienvenido, soy Zeus Bot.</h3><p>Te enseñaré a comprar en nuestro sitio web.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Descripción de la imagen' style='width: 100%; max-width: 200px;'>"
                },
                {
                    element: '#buscar-productos',
                    intro: "<h3>Buscar productos</h3><p>Aquí puedes buscar productos por nombre o descripción.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Buscar productos' style='width: 100%; max-width: 200px;'>"
                },
                {
                    element: '.btn-comprar',
                    intro: "<h3>Comprar producto</h3><p>Este botón te permitirá comprar el producto seleccionado.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Botón de comprar' style='width: 100%; max-width: 200px;'>"
                },
                {
                    element: '.bi-cart',
                    intro: "<h3>Carrito de compras</h3><p>Presiona este boton para seguir con la compra.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Carrito de compras' style='width: 100%; max-width: 200px;'>"
                }
            ],
            nextLabel: 'Siguiente',
            prevLabel: 'Anterior',
    
            doneLabel: 'Hecho',
        }).start();
    }
</script>

</head>
<body>
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
                    <li class="nav-item"><a class="nav-link" href="indexusuario.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="nosotrosusuario.jsp">Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="informacionusuario.jsp">Información</a></li>
                    <li class="nav-item"><a class="nav-link active" href="homeusuario.jsp">Productos</a></li>
                    <li class="nav-item"><a class="nav-link" href="contactousuario.jsp">Contacto</a></li>
                </ul>
                <!-- Añadido ID para búsqueda -->
                <form class="d-flex" id="buscar-productos">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn btn-outline-light" type="submit">Buscar</button>
                </form>
                <ul class="navbar-nav ms-3">
                   <li class="nav-item d-flex align-items-center">
                        <div class="dropdown">
                            <button class="btn p-0" data-bs-toggle="dropdown" aria-expanded="false" style="border: none; background: none;">
                                <img src="<%= session.getAttribute("fotoperfil") != null ? session.getAttribute("fotoperfil") : "https://via.placeholder.com/40" %>" class="rounded-circle" alt="Avatar" width="40" height="40">
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="perfilusuario.jsp">Mi Perfil</a></li>
                                <li><a class="dropdown-item" href="eliminarcuenta.jsp">Eliminar Cuenta</a></li>
                                <li><a class="dropdown-item" href="CerrarSesion">Cerrar Sesión</a></li>
                            </ul>
                        </div>
                        <span class="text-white ms-2"><%= session.getAttribute("nombreusuario") %></span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="carrito.jsp" onclick="mostrarCarrito()">
                            <i class="bi bi-cart"></i> Carrito
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<!-- Contenedor del catálogo -->
<div class="container mt-5">
    <h2 class="mb-4 text-center">Catálogo de Productos</h2>
    <div class="row g-4">

        <%
            // Conexión a la base de datos
            String url = "jdbc:mysql://localhost:3306/zeusstore";
            String user = "root";
            String password = "123456";
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                String query = "SELECT * FROM producto";
                rs = stmt.executeQuery(query);

                // Mostrar productos
                while(rs.next()) {
                    int idProducto = rs.getInt("idproducto"); // Obtener el id del producto
                    String nombre = rs.getString("nombre");
                    String imagen = rs.getString("imagen"); // URL o nombre del archivo de imagen
                    float precio = rs.getFloat("precio");
        %>

       <!-- Cada tarjeta de producto -->
<div class="col-lg-4 col-md-6">
    <div class="card h-100">
        <a href="infoproducto.jsp?idproducto=<%= idProducto %>"> <!-- Añadir enlace a la imagen -->
            <img src="<%= imagen %>" class="card-img-top" alt="<%= nombre %>">
        </a>
        <div class="card-body">
            <h5 class="card-title"><%= nombre %></h5>
            <p class="card-text"><strong>Precio:</strong> S/. <%= precio %></p>
            <!-- Añadido class "btn-comprar" para que lo reconozca Intro.js -->
            <a href="infoproducto.jsp?idproducto=<%= idProducto %>" class="btn btn-success btn-comprar">Comprar</a>
        </div>
    </div>
</div>


        <%
                } // Cierre del bucle while
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<div class='alert alert-danger' role='alert'>Error al cargar los productos. Inténtelo más tarde.</div>");
            } finally {
                // Cerrar recursos
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>

    </div>
</div>

<!-- Botón flotante -->
<a href="#" onclick="iniciarGuia()" class="btn-flotante">
    <img src="https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png" alt="Guía" class="img-flotante">
</a>

<!-- Footer -->
<footer class="bg-dark text-white text-center mt-5 py-4">
  <h5>Agendame</h5>
  <ul class="list-unstyled d-flex justify-content-center mb-3">
    <li class="mx-3"><a href="#about" class="text-white text-decoration-none">Acerca de</a></li>
    <li class="mx-3"><a href="#services" class="text-white text-decoration-none">Servicios</a></li>
    <li class="mx-3"><a href="#contact" class="text-white text-decoration-none">Contacto</a></li>
  </ul>
  <ul class="list-unstyled d-flex justify-content-center mb-3">
    <li class="mx-3"><a href="https://www.facebook.com" target="_blank" class="text-white"><i class="bi bi-facebook"></i></a></li>
    <li class="mx-3"><a href="https://www.twitter.com" target="_blank" class="text-white"><i class="bi bi-twitter"></i></a></li>
    <li class="mx-3"><a href="https://www.instagram.com" target="_blank" class="text-white"><i class="bi bi-instagram"></i></a></li>
  </ul>
  <p class="mb-0">© 2024 Nombre de tu Sitio Web. Todos los derechos reservados.</p>
</footer>
</body>
</html>
