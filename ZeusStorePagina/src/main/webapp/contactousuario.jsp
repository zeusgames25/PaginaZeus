<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Contacto</title>
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<style>
  body {
      color: #fff; /* Texto blanco */
  }
  .contact-form {
      background-color: #333; /* Fondo gris oscuro para el formulario */
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.1);
      transition: transform 0.3s ease-in-out;
  }
  .contact-form:hover {
      transform: scale(1.02); /* Efecto de agrandado al pasar el mouse */
  }
  .form-control {
      background-color: #ffffff;
      border: none;
      border-bottom: 2px solid #fff; /* Borde blanco solo en la parte inferior */
      border-radius: 5;
      color: #fff;
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
  .form-control:focus {
      background-color: #444;
      border-bottom-color: #1f8ef1; /* Borde azul en el foco */
      box-shadow: none;
  }
  .btn-custom {
      background-color: #1f8ef1; /* Botón azul */
      color: #fff;
      border: none;
      border-radius: 50px;
      padding: 0.75rem 2rem;
      transition: background-color 0.3s ease;
  }
  .btn-custom:hover {
      background-color: #fff;
      color: #000; /* Efecto inverso al pasar el mouse */
  }
  .custom-border {
      border: 1px solid #000 !important;
  }
  .card-img-top {
      transition: transform 0.3s ease;
  }
  .card-img-top:hover {
      transform: scale(1.05); /* Efecto de zoom */
  }
   function closeAlert(element) {
        // Cierra el mensaje de alerta
        element.parentElement.style.display = 'none';
    }
</style>
</head>

<body>
<!-- Header -->
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
                    <li class="nav-item"><a class="nav-link active" href="contactousuario.jsp">Contacto</a></li>
                </ul>
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

<!-- Formulario de contacto -->
<div class="container">
  <br></br>
        
    <div class="row justify-content-center">
     <!-- Mostrar mensaje solo si existe -->
       <% 
    String success = (String) request.getAttribute("success");
    String message = (String) request.getAttribute("message");
    
    if ("true".equals(success)) { 
%>
    <!-- Mensaje de éxito -->
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% 
    } else if ("false".equals(success)) { 
%>
    <!-- Mensaje de error -->
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= message %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<%
    } 
%>
        <div class="col-md-6">
            <div class="contact-form mt-5">
                <h2 class="text-center mb-4">Contáctanos</h2>
                <form action="GuardarSugerenciaServlet" method="post">
                    <!-- Campo oculto para idusuario -->
                    <input type="hidden" name="idusuario" value="<%= session.getAttribute("idusuario") %>">
                    <div class="mb-3">
                        <label for="nombreusuario" class="form-label">Nombre de Usuario</label>
                        <input type="text" class="form-control" id="nombreusuario" name="nombreusuario" required>
                    </div>
                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo Electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" required>
                    </div>
                    <div class="mb-3">
                        <label for="mensaje" class="form-label">Mensaje</label>
                        <textarea class="form-control" id="mensaje" name="mensaje" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-custom">Enviar</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!-- Footer -->
<footer class="bg-dark text-white text-center mt-5 py-4">
  <h5>Agendame</h5>
  <ul class="list-unstyled d-flex justify-content-center mb-3">
    <li class="mx-3"><a href="#about" class="text-white text-decoration-none">Acerca de</a></li>
    <li class="mx-3"><a href="#services" class="text-white text-decoration-none">Servicios</a></li>
    <li class="mx-3"><a href="#contact" class="text-white text-decoration-none">Contacto</a></li>
  </ul>
  <ul class="list-unstyled d-flex justify-content-center mb-3">
    <li class="mx-3"><a href="https://www.facebook.com/profile.php?id=61551294025673" target="_blank" class="text-white"><i class="bi bi-facebook"></i></a></li>
    <li class="mx-3"><a href="https://www.twitter.com" target="_blank" class="text-white"><i class="bi bi-twitter"></i></a></li>
    <li class="mx-3"><a href="https://www.instagram.com/zeusstoreof?igsh=MXdya25qZzUwNHYzbg==" target="_blank" class="text-white"><i class="bi bi-instagram"></i></a></li>
  </ul>
  <p class="mb-0">© 2024 Nombre de tu Sitio Web. Todos los derechos reservados.</p>
</footer>

</body>
</html>
