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
                    <li class="nav-item"><a class="nav-link" href="indexusuario.jsp">Inicio</a></li>
                    <li class="nav-item"><a class="nav-link active" href="nosotrosusuario.jsp">Nosotros</a></li>
                    <li class="nav-item"><a class="nav-link" href="informacionusuario.jsp">Información</a></li>
                    <li class="nav-item"><a class="nav-link" href="homeusuario.jsp">Productos</a></li>
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
      <img src="https://scontent.faqp1-1.fna.fbcdn.net/v/t39.30808-6/405620069_122126116442043134_3220468723193211072_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeHyxi2KZokO-tb3mb8aXuiT0X6tA_7M_LHRfq0D_sz8sQYs0DP3sR-HHps22t9hdiZTjB93j2R8-UPjx7qqp3Dg&_nc_ohc=pA3MH1Z_dksQ7kNvgGIw2w-&_nc_ht=scontent.faqp1-1.fna&_nc_gid=AilBAkeWMriulFWtmsv5Sil&oh=00_AYAkhqVd-AI8n8dd3OUsr9E2EKq7uP0GlYMXI6bzke3C-w&oe=670168BD" class="about-image img-fluid" alt="Sobre Nosotros">
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