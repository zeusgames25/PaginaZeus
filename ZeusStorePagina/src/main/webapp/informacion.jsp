<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Información</title>
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<style>
    .contact-section {
        background-color: #f8f9fa;
        padding: 50px 0;
        border-radius: 8px;
        box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
    }
    .contact-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: none;
        border-radius: 10px;
    }
    .contact-card:hover {
        transform: scale(1.02);
        box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
    }
    .info-icon {
        font-size: 1.5rem;
        color: #007bff;
        margin-right: 10px;
    }
    .map-container {
        border: 2px solid #000;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    /* Efecto en la imagen del mapa */
    .map-container iframe {
        transition: transform 0.3s ease;
    }
    .map-container iframe:hover {
        transform: scale(1.02);
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
          <li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="nosotros.jsp">Nosotros</a></li>
          <li class="nav-item"><a class="nav-link active" href="informacion.jsp">Información</a></li>
          <li class="nav-item"><a class="nav-link" href="productos.jsp">Productos</a></li>
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

<!-- Sección de información de contacto -->
<div class="container contact-section mt-5">
  <h2 class="text-center mb-5">Información de Contacto</h2>
  <div class="row g-4">
    <div class="col-lg-6">
      <div class="card contact-card p-4">
        <div class="card-body">
          <h4 class="card-title mb-4"><i class="bi bi-geo-alt-fill info-icon"></i> Dirección</h4>
          <p class="card-text">Jr. Tarapacá 938, Lima, Perú</p>
          <h4 class="card-title mt-4"><i class="bi bi-telephone-fill info-icon"></i> Teléfono</h4>
          <p class="card-text">917153607</p>
          <h4 class="card-title mt-4"><i class="bi bi-envelope-fill info-icon"></i> Correo Electrónico</h4>
          <p class="card-text">info@coleccionesfiguras.com</p>
        </div>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="map-container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.7572653523684!2d-78.52102292412127!3d-7.154039370187639!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91b25af830940b19%3A0x818d5858f3eac00d!2sJr.%20Tarapac%C3%A1%20938%2C%20Cajamarca%2006001!5e0!3m2!1ses!2spe!4v1727760922072!5m2!1ses!2spe" width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
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
    <li class="mx-3"><a href="https://www.facebook.com/profile.php?id=61551294025673" target="_blank" class="text-white"><i class="bi bi-facebook"></i></a></li>
    <li class="mx-3"><a href="https://www.twitter.com" target="_blank" class="text-white"><i class="bi bi-twitter"></i></a></li>
    <li class="mx-3"><a href="https://www.instagram.com/zeusstoreof?igsh=MXdya25qZzUwNHYzbg==" target="_blank" class="text-white"><i class="bi bi-instagram"></i></a></li>
  </ul>
  <p class="mb-0">© 2024 Nombre de tu Sitio Web. Todos los derechos reservados.</p>
</footer>

</body>
</html>
