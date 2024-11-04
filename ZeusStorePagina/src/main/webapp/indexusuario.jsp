<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Inicio</title>
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
    </style>
<style>
  .custom-border {
    border: 1px solid #000 !important;
  }
  /* Efecto de interacción para las imágenes */
  .card-img-top {
    transition: transform 0.3s ease;
  }
          .hero-section {
            background-color: #343a40;
            color: white;
            padding: 50px 0;
            border-radius: 8px;
        }
  .card-img-top:hover {
    transform: scale(1.05); /* Efecto de zoom */
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

    <div class="hero-section text-center mt-4">
        <h1 class="display-4">¡BIENVENIDO!</h1>
        <p class="lead">Aqui encontraras las mejores figuras de colección de todas las marcas.</p>
        <a href="homeusuario.jsp" class="btn btn-success btn-lg">CATALOGO</a>
    </div>

<div class="container mt-5">
  <h2 class="mb-4">PREVENTAS</h2>
  <div class="row g-4">
    <div class="col-lg-4">
      <div class="card h-100 custom-border">
        <img src="https://i.ibb.co/6R7MnqD/1-3fa395d4-8db2-41f4-9336-36d512243580.png" class="card-img-top" alt="Medicos">
        <div class="card-body">
          <h5 class="card-title">Gohan SSJ Beast Funko Shop</h5>
          <p class="card-text">Gohan en su forma SSJ Beast, exclusivo de Funko Shop. Un imprescindible para los fans de Dragon Ball Super.</p>
          <a href="login.jsp" class="btn btn-success">Reservar</a>
          <a href="#" class="btn btn-primary">Información</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="card h-100 custom-border">
        <img src="https://funkoeurope.com/cdn/shop/files/Pop_Ladypool_Diamond_hi-res_800x.jpg?v=1722242174" class="card-img-top" alt="Abogados">
        <div class="card-body">
          <h5 class="card-title">LadyPool Diamon Funko Shop</h5>
          <p class="card-text">Añade un toque de brillo a tu colección con el Funko exclusivo de LadyPool Diamond. Con su traje clásico y un acabado brillante que deslumbra</p>
          <a href="login.jsp" class="btn btn-success">Reservar</a>
          <a href="#" class="btn btn-primary">Información</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4">
      <div class="card h-100 custom-border">
        <img src="https://i.ebayimg.com/images/g/gw4AAOSwsHplG8aj/s-l1600.jpg" class="card-img-top" alt="Servicios Generales">
        <div class="card-body">
          <h5 class="card-title">Spiderman 100 años Funko Shop</h5>
          <p class="card-text">Celebra 100 años de Spiderman con esta figura exclusiva de Funko Shop. Perfecta para fanáticos de Marvel.</p>
          <a href="login.jsp" class="btn btn-success">Reservar</a>
          <a href="#" class="btn btn-primary">Información</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>

<!-- Footer -->
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

</html>