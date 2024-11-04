<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Perfil Profesional</title>
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/intro.js/minified/introjs.min.css">
<script src="https://cdn.jsdelivr.net/npm/intro.js/minified/intro.min.js"></script>

<style>
  .custom-border {
    border: 1px solid #000 !important;
  }
  /* Efecto de interacción para las imágenes */
  .card-img-top {
    transition: transform 0.3s ease;
  }
  .card-img-top:hover {
    transform: scale(1.05); /* Efecto de zoom */
  }
  /* Estilos para el avatar */
  .avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
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
</style>

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
                    <li class="nav-item"><a class="nav-link active" href="indexusuario.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link" href="nosotrosusuario.jsp">Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="informacionusuario.jsp">Información</a></li>
                    <li class="nav-item"><a class="nav-link" href="homeusuario.jsp">Productos</a></li>
                    <li class="nav-item"><a class="nav-link" href="contactousuario.jsp">Contacto</a></li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                    <button class="btn btn-outline-light" typev="submit">Buscar</button>
                </form>
                <ul class="navbar-nav ms-3">
                    <li class="nav-item user-info">
                        <a href="perfilcliente.jsp">
                            <img src="https://via.placeholder.com/50" alt="Usuario" class="img-fluid"> <!-- Imagen de usuario como botón -->
                        </a>
                        <a href="perfilcliente.jsp">
                        <span class="nav-link text-white">Nombre de Usuario</span>
                          </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#" onclick="mostrarCarrito()">
                            <i class="bi bi-cart"></i> Carrito
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container text-center mt-5">
  <h1 class="display-4">MI PERFIL</h1>
  <p class="lead">Consulta y actualiza tu perfil de cliente.</p>
</div>

<div class="container mt-5">
  <div class="row">
    <div class="col-lg-4 text-center">
      <!-- Avatar y opción para editar -->
      <div class="position-relative">
        <img src="https://static.vecteezy.com/system/resources/previews/015/407/577/non_2x/doctor-round-avatar-medicine-flat-avatar-with-male-doctor-medical-clinic-team-round-icon-medical-collection-illustration-vector.jpg" class="rounded-circle" alt="Avatar del profesional" width="150" height="150">
        <a href="editarperfil.jsp" class="position-absolute top-0 start-100 translate-middle p-2 bg-primary rounded-circle">
          <i class="bi bi-pencil-fill text-white"></i>
        </a>
      </div>
      <h3 class="mt-3"><%= request.getAttribute("nombreusuario") %></h3> <!-- Nombre del profesional -->
    </div>
    <div class="col-lg-8">
      <!-- Información del profesional obtenida de la base de datos -->
      <h4>Información del usuario</h4>
      <ul class="list-group">
        <li class="list-group-item"><strong>Nombres:</strong> <%= request.getAttribute("nombres") %></li>
        <li class="list-group-item"><strong>Apellidos:</strong> <%= request.getAttribute("apellidos") %></li>
        <li class="list-group-item"><strong>Celular:</strong> <%= request.getAttribute("celular") %></li>
        <li class="list-group-item"><strong>Fecha de Nacimiento:</strong> <%= request.getAttribute("fechanacimiento") %></li>
        <li class="list-group-item"><strong>Direccion:</strong> <%= request.getAttribute("direccion") %></li>
        <li class="list-group-item"><strong>correo:</strong> <%= request.getAttribute("correo") %></li>
      </ul>
      <!-- Otras opciones -->
      <div class="mt-4">
        <a href="editarperfil.jsp" class="btn btn-primary">Editar Perfil</a>
        <a href="eliminarcuenta.jsp" class="btn btn-danger">Eliminar Cuenta</a>
      </div>
    </div>
  </div>
</div>

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
