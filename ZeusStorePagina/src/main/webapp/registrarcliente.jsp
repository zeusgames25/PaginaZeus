<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro</title>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f5f5f5;
}

.custom-header {
	background-color: #000000;
	padding: 1rem 0;
}

.custom-footer {
	background-color: #000000;
	color: #fff;
	text-align: center;
	padding: 1rem 0;
}

.custom-form {
	background-color: #ffffff;
	border-radius: 8px;
	padding: 2rem;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<!-- Encabezado -->
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
          <li class="nav-item"><a class="nav-link" href="informacion.jsp">Información</a></li>
          <li class="nav-item"><a class="nav-link" href="productos.jsp">Productos</a></li>
          <li class="nav-item"><a class="nav-link" href="contacto.jsp">Contacto</a></li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
          <button class="btn btn-outline-light" type="submit">Buscar</button>
        </form>
        <ul class="navbar-nav ms-3">
          <li class="nav-item"><a class="nav-link active" href="Registrarcliente.jsp"><i class="bi bi-person-plus"></i> Registrate</a></li>
          <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="bi bi-box-arrow-in-right"></i> Acceder</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>

	<!-- Formulario de Registro -->
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="custom-form">
					<h2 class="text-center mb-4">Registro</h2>
					<form action="GuardarDatosClienteServlet" method="POST">
						<div class="mb-3">
							<label for="nombres" class="form-label">Nombres</label>
							<input type="text" class="form-control" id="nombres" name="nombres" required>
						</div>
						<div class="mb-3">
							<label for="apellidos" class="form-label">Apellidos</label>
							<input type="text" class="form-control" id="apellidos" name="apellidos" required>
						</div>
						<div class="mb-3">
							<label for="celular" class="form-label">Celular</label>
							<input type="tel" class="form-control" id="celular" name="celular" required>
						</div>
						<div class="mb-3">
							<label for="fechanacimiento" class="form-label">Fecha de nacimiento</label>
							<input type="date" class="form-control" id="fechanacimiento" name="fechanacimiento" required>
						</div>
						<div class="mb-3">
							<label for="departamento" class="form-label">Departamento</label>
							<input type="text" class="form-control" id="departamento" name="departamento" required>
						</div>
						<div class="mb-3">
							<label for="direccion" class="form-label">Dirección</label>
							<input type="text" class="form-control" id="direccion" name="direccion" required>
						</div>
						<div class="mb-3">
							<label for="correo" class="form-label">Correo</label>
							<input type="email" class="form-control" id="correo" name="correo" required>
						</div>
						<div class="mb-3">
							<label for="nombreusuario" class="form-label">Nombre de Usuario</label>
							<input type="text" class="form-control" id="nombreusuario" name="nombreusuario" required>
						</div>
						<div class="mb-3">
							<label for="contraseña" class="form-label">Contraseña</label>
							<input type="password" class="form-control" id="contraseña" name="contraseña" required>
						</div>
						<button type="submit" class="btn btn-dark w-100">Registrarse</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Pie de página -->
	<footer class="custom-footer">
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

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
