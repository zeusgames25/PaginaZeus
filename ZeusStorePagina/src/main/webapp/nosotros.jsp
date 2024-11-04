<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Nosotros</title>
<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<style>
  .custom-border {
    border: 1px solid #000 !important;
  }
  .hero-section {
    background-color: #343a40;
    color: white;
    padding: 50px 0;
    border-radius: 8px;
  }
  .section-title {
    font-size: 2.5rem;
    font-weight: bold;
    color: #333;
    margin-bottom: 20px;
  }
  .about-section {
    background-color: #f8f9fa;
    padding: 60px 20px;
    border-radius: 8px;
  }
  .about-text {
    font-size: 1.1rem;
    color: #555;
    line-height: 1.8;
  }
  .about-image {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }
  .about-image:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
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
          <li class="nav-item"><a class="nav-link active" href="nosotros.jsp">Nosotros</a></li>
          <li class="nav-item"><a class="nav-link" href="informacion.jsp">información</a></li>
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
          <li class="nav-item"><a class="nav-link" href="registrarcliente.jsp"><i class="bi bi-person-plus"></i> Regístrate</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Acceder</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>

<!-- Sección Nosotros -->
<div class="container about-section mt-5">
  <div class="row align-items-center">
    <div class="col-md-6">
      <h2 class="section-title">Sobre Nosotros</h2>
      <p class="about-text">
        Somos una tienda especializada en figuras de colección de las marcas más populares y exclusivas. Nuestra misión es ofrecer a los coleccionistas las piezas más buscadas y de mayor calidad, asegurando una experiencia única de compra. Nos apasiona el mundo del coleccionismo y nos esforzamos por brindar un servicio excepcional, ofreciendo productos originales y limitados.
      </p>
      <p class="about-text">
        Ya sea que seas un coleccionista experimentado o recién estés comenzando, aquí encontrarás una gran variedad de figuras que seguramente te encantarán. Nos destacamos por nuestra atención al detalle y la calidad en cada uno de nuestros productos.
      </p>
    </div>
    <div class="col-md-6 text-center">
      <img src="https://scontent.fcja2-1.fna.fbcdn.net/v/t39.30808-6/413810056_122131249736043134_5869407265569960939_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeF9WwQzT7pBT6E2_V5oX7crxm-Lw6mGdWDGb4vDqYZ1YAA6CZzpaEF-XjRtGshdbfK7S8XOFAu4guinOCEbtQzV&_nc_ohc=DrbbqbEl-o4Q7kNvgG0l39r&_nc_zt=23&_nc_ht=scontent.fcja2-1.fna&_nc_gid=AlWobWZrDse7LN0RKgWLuHT&oh=00_AYAYiY4qJlU6vcxtROtQXJuqV7oZWgXgh03R6dKo-fsZ9w&oe=6714F5C0" alt="Sobre Nosotros">
    </div>
  </div>
</div>

<!-- Efectos para agregar dinamismo -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('.about-image');
    images.forEach(img => {
      img.addEventListener('mouseover', () => {
        img.style.transform = 'scale(1.1)';
      });
      img.addEventListener('mouseout', () => {
        img.style.transform = 'scale(1)';
      });
    });
  });
</script>

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
l>