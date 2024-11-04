<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Información del Producto</title>
<!-- Bootstrap CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Intro.js para la guía -->
<link
	href="https://cdn.jsdelivr.net/npm/intro.js/minified/introjs.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/intro.js/minified/intro.min.js"></script>
<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">

<style>
body {
	background-color: #f8f9fa;
	font-family: Arial, sans-serif;
}

.product-container {
	background-color: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin: 20px auto;
	max-width: 800px;
	display: flex;
	align-items: center;
}

.product-image {
	max-width: 300px;
	height: auto;
	border-radius: 12px;
	margin-right: 20px;
}

.product-title {
	font-size: 2rem;
	color: #333;
}

.product-price {
	font-size: 1.5rem;
	color: #28a745;
	font-weight: bold;
}

.product-description {
	margin-top: 10px;
	font-size: 1rem;
	color: #555;
}

.product-stock {
	margin-top: 10px;
	font-size: 1rem;
	color: #dc3545;
}

.btn-custom {
	background-color: #007bff;
	color: white;
}

.btn-custom:hover {
	background-color: #0056b3;
}

.back-button {
	color: #6c757d;
	text-decoration: none;
}

.back-button:hover {
	text-decoration: underline;
}

.specifications, .reviews, .related-products {
	margin-top: 30px;
}

.specifications h3, .reviews h3, .related-products h3 {
	font-size: 1.5rem;
	color: #333;
}

.specifications ul, .reviews ul, .related-products ul {
	list-style-type: none;
	padding-left: 0;
}

.rating {
	display: flex;
	align-items: center;
	margin-top: 10px;
}

.star {
	color: #FFD700; /* Color dorado para las estrellas */
	font-size: 1.2rem;
	margin-right: 2px;
}

.rating-text {
	margin-left: 5px;
	font-size: 1rem;
	color: #555;
}

<
style>.contact-section {
	background-color: #f8f9fa;
	padding: 50px 0;
	border-radius: 8px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.user-info {
	display: flex;
	align-items: center;
}

.info-icon {
	font-size: 1.5rem;
	color: #007bff;
	margin-right: 10px;
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
	/* Sombra para dar profundidad */
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

.introjs-tooltip img {
	border-radius: 8px; /* Bordes redondeados en la imagen */
	margin: 10px 0; /* Margen alrededor de la imagen */
	width: 100%; /* Ancho completo */
	height: auto; /* Altura automática para mantener la proporción */
}

.img-flotante {
	width: 100%;
	height: 100%;
	object-fit: cover;
	/* Asegura que la imagen se ajuste bien al tamaño del botón */
	border-radius: 50%;
}

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
	object-fit: cover;
	/* Asegura que la imagen se ajuste bien al tamaño del botón */
	border-radius: 50%;
}
</style>
<script>
	// Función para iniciar la guía
	function iniciarGuia() {
		introJs()
				.setOptions(
						{
							steps : [
									{
										intro : "<h3>Bienvenido, soy Zeus Bot.</h3><p>Te enseñaré a comprar en nuestro sitio web.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Descripción de la imagen' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '#product-price',
										intro : "<h3>Precio</h3><p>Aquí puedes ver el precio del producto.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Buscar productos' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '#product-description',
										intro : "<h3>Descripcion</h3><p>Aqui puedes ver una breve descripcion del producto.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Botón de comprar' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '#container-detalles',
										intro : "<h3>Detalles</h3><p>Aqui puedes ver detalles adicionales del producto.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Carrito de compras' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '.btn-agregar',
										intro : "<h3>Carrito de compras</h3><p>Este icono te lleva a tu carrito de compras.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Carrito de compras' style='width: 100%; max-width: 200px;'>"
									} ],
							nextLabel : 'Siguiente',
							prevLabel : 'Anterior',

							doneLabel : 'Hecho',
						}).start();
	}
</script>
</head>
<body>
	<div style="background-color: #000000;">
		<div class="text-center py-3">
			<img src="https://i.postimg.cc/kGL7j8sy/portada-fb-final-gytgvg.png"
				class="img-fluid img-rounded" alt="Logo" width="900" height="250">
		</div>

		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link"
							href="indexusuario.jsp">Inicio</a></li>
						<li class="nav-item"><a class="nav-link"
							href="nosotrosusuario.jsp">Nosotros</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="informacionusuario.jsp">Información</a></li>
						<li class="nav-item"><a class="nav-link"
							href="homeusuario.jsp">Productos</a></li>
						<li class="nav-item"><a class="nav-link"
							href="contactousuario.jsp">Contacto</a></li>
					</ul>
					<!-- Añadido ID para búsqueda -->
					<form class="d-flex" id="buscar-productos">
						<input class="form-control me-2" type="search"
							placeholder="Buscar" aria-label="Buscar">
						<button class="btn btn-outline-light" type="submit">Buscar</button>
					</form>
					<ul class="navbar-nav ms-3">
						<li class="nav-item d-flex align-items-center">
							<div class="dropdown">
								<button class="btn p-0" data-bs-toggle="dropdown"
									aria-expanded="false" style="border: none; background: none;">
									<img
										src="<%=session.getAttribute("fotoperfil") != null ? session.getAttribute("fotoperfil")
		: "https://via.placeholder.com/40"%>"
										class="rounded-circle" alt="Avatar" width="40" height="40">
								</button>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="perfilusuario.jsp">Mi
											Perfil</a></li>
									<li><a class="dropdown-item" href="eliminarcuenta.jsp">Eliminar
											Cuenta</a></li>
									<li><a class="dropdown-item" href="CerrarSesion">Cerrar
											Sesión</a></li>
								</ul>
							</div> <span class="text-white ms-2"><%=session.getAttribute("nombreusuario")%></span>
						</li>
						<li class="nav-item"><a class="nav-link text-white" href="carrito.jsp"
							onclick="mostrarCarrito()"> <i class="bi bi-cart"></i>
								Carrito
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<%
		String idProducto = request.getParameter("idproducto");
		if (idProducto != null && !idProducto.isEmpty()) {
			String url = "jdbc:mysql://localhost:3306/zeusstore";
			String user = "root";
			String password = "123456";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				String query = "SELECT * FROM producto WHERE idproducto = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(idProducto));
				rs = pstmt.executeQuery();

				if (rs.next()) {
			// Obtener información del producto
			String nombre = rs.getString("nombre");
			String imagen = rs.getString("imagen");
			float precio = rs.getFloat("precio");
			String descripcion = rs.getString("descripcion");
			int stock = rs.getInt("stock");
		%>
		<div class="product-container">
			<img src="<%=imagen%>" alt="<%=nombre%>" class="product-image">
			<div>
				<h1 class="product-title"><%=nombre%></h1>
				<p class="product-price" id="product-price">
					S/.
					<%=precio%></p>
				<p class="product-description" id="product-description">
					<strong>Descripción:</strong>
					<%=descripcion%></p>
				<p class="product-stock">
					<strong>Stock disponible:</strong>
					<%=stock%></p>
				<div class="rating">
					<!-- Estrellas para la calificación -->
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9733;</span> <span class="star">&#9733;</span>
					<span class="star">&#9734;</span> <span class="rating-text">4.5/5</span>
					<!-- Calificación fija -->
				</div>
				<div class="d-flex justify-content-start mt-3">
					<a href="agregarCarrito.jsp?idproducto=<%=idProducto%>"
						class="btn btn-custom me-2 btn-agregar"> <i class="bi bi-cart"></i>
						Agregar al Carrito
					</a> <a href="homeusuario.jsp"
						class="btn btn-outline-secondary back-button"> <i
						class="bi bi-arrow-left"></i> Volver al Catálogo
					</a>
				</div>
			</div>
		</div>

		<div class="container mt-5">
			<div class="specifications" id="container-detalles">
				<h3 class="mb-4">Especificaciones Técnicas</h3>
				<div class="card mb-4 shadow-sm border-light">
					<div class="card-body">
						<ul class="list-unstyled">
							<li class="d-flex justify-content-between border-bottom py-2">
								<span class="fw-bold">Dimensiones:</span> <span>30 x 20 x
									15 cm</span>
							</li>
							<li class="d-flex justify-content-between border-bottom py-2">
								<span class="fw-bold">Peso:</span> <span>1.5 kg</span>
							</li>
							<li class="d-flex justify-content-between border-bottom py-2">
								<span class="fw-bold">Color:</span> <span>Rojo</span>
							</li>
							<li class="d-flex justify-content-between border-bottom py-2">
								<span class="fw-bold">Garantía:</span> <span>2 años</span>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="reviews">
				<h3 class="mb-4">Opiniones de Clientes</h3>
				<div class="card mb-4 shadow-sm border-light">
					<div class="card-body">
						<ul class="list-unstyled">
							<li class="mb-2"><span class="fw-bold">Juan Pérez:</span> <span>
									Muy buen producto, lo recomiendo.</span></li>
							<li><span class="fw-bold">Ana Gómez:</span> <span>
									Excelente calidad, superó mis expectativas.</span></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="related-products">
				<h3 class="mb-4">Productos Relacionados</h3>
				<div class="card mb-4 shadow-sm border-light">
					<div class="card-body">
						<ul class="list-unstyled">
							<li class="mb-2"><a href="producto.jsp?idproducto=2"
								class="text-decoration-none text-primary">Producto 1</a></li>
							<li class="mb-2"><a href="producto.jsp?idproducto=3"
								class="text-decoration-none text-primary">Producto 2</a></li>
							<li><a href="producto.jsp?idproducto=4"
								class="text-decoration-none text-primary">Producto 3</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<%
		} else {
		out.println("<p class='text-danger text-center'>Producto no encontrado.</p>");
		}
		} catch (SQLException | ClassNotFoundException e) {
		e.printStackTrace();
		} finally {
		try {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		}
		} else {
		out.println("<p class='text-danger text-center'>ID de producto no especificado.</p>");
		}
		%>
	</div>

	<!-- Botón flotante -->
	<a href="#" onclick="iniciarGuia()" class="btn-flotante"> <img
		src="https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png"
		alt="Guía" class="img-flotante">
	</a>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>


<!-- Footer -->
<footer class="bg-dark text-white text-center mt-5 py-4">
	<h5>Agendame</h5>
	<ul class="list-unstyled d-flex justify-content-center mb-3">
		<li class="mx-3"><a href="#about"
			class="text-white text-decoration-none">Acerca de</a></li>
		<li class="mx-3"><a href="#services"
			class="text-white text-decoration-none">Servicios</a></li>
		<li class="mx-3"><a href="#contact"
			class="text-white text-decoration-none">Contacto</a></li>
	</ul>
	<ul class="list-unstyled d-flex justify-content-center mb-3">
		<li class="mx-3"><a href="https://www.facebook.com"
			target="_blank" class="text-white"><i class="bi bi-facebook"></i></a></li>
		<li class="mx-3"><a href="https://www.twitter.com"
			target="_blank" class="text-white"><i class="bi bi-twitter"></i></a></li>
		<li class="mx-3"><a href="https://www.instagram.com"
			target="_blank" class="text-white"><i class="bi bi-instagram"></i></a></li>
	</ul>
	<p class="mb-0">© 2024 Nombre de tu Sitio Web. Todos los derechos
		reservados.</p>
</footer>
</body>
</html>
