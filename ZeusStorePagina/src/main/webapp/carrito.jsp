<%@ page import="DB.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
    <!-- Intro.js para la guía -->
<link
	href="https://cdn.jsdelivr.net/npm/intro.js/minified/introjs.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/intro.js/minified/intro.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table {
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
            border-radius: 50px;
            padding: 10px 20px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .total-price {
            font-weight: bold;
            font-size: 1.5rem;
        }
        .no-products {
            font-size: 1.2rem;
            color: #dc3545;
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
										intro : "<h3>Bienvenido, soy Zeus Bot.</h3><p>Terminemos tu compra.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Descripción de la imagen' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '#tabla-resumen',
										intro : "<h3>Resumen</h3><p>Aquí puedes ver un resumen de los productos que has agregado.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Buscar productos' style='width: 100%; max-width: 200px;'>"
									},
									{
										element : '.btn-finalizar',
										intro : "<h3>Carrito de compras</h3><p>Este boton finaliza el proceso de compra y solo que esperar que tu producto llegue o te llame algun asesor.</p><img src='https://static.vecteezy.com/system/resources/thumbnails/025/143/641/small/fairy-tale-character-free-png.png' alt='Carrito de compras' style='width: 100%; max-width: 200px;'>"
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
                    <li class="nav-item"><a class="nav-link" href="homeusuario.jsp">Productos</a></li>
                    <li class="nav-item"><a class="nav-link" href="contactousuario.jsp">Contacto</a></li>
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
                        <a class="nav-link text-white" href="#" onclick="mostrarCarrito()">
                            <i class="bi bi-cart"></i> Carrito
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container mt-5">
    <h1 class="text-center">Carrito de Compras</h1>
    <table class="table table-bordered mt-3" id="tabla-resumen">
        <thead>
            <tr>
                <th>ID Producto</th>
                <th>Precio Unitario</th>
                <th>Cantidad</th>
                <th>Precio Parcial</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                double total = 0;

                try {
                    // Conectar a la base de datos
                    con = DBConnection.getConnection();
                    // Crear la consulta SQL
                    String query = "SELECT idproducto, preciounitario, cantidad, totalparcial FROM carrito";
                    stmt = con.createStatement();
                    rs = stmt.executeQuery(query);

                    // Iterar a través de los resultados
                    while (rs.next()) {
                        int idProducto = rs.getInt("idproducto");
                        double precioUnitario = rs.getDouble("preciounitario");
                        int cantidad = rs.getInt("cantidad");
                        double precioParcial = rs.getDouble("totalparcial");
                        total += precioParcial; // Sumar al total
            %>
                        <tr>
                            <td><%= idProducto %></td>
                            <td>S/. <%= precioUnitario %></td>
                            <td><%= cantidad %></td>
                            <td>S/. <%= precioParcial %></td>
                        </tr>
            <%
                    }
                    // Si no hay productos en el carrito
                    if (total == 0) {
            %>
                        <tr>
                            <td colspan="4" class="text-center no-products">No hay productos en el carrito.</td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    // Cerrar recursos
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between align-items-center mt-4">
        <h4 class="total-price">Total: S/. <%= total > 0 ? total : 0 %> Soles</h4>
        <a href="mensajecompraexitosa.jsp" class="btn btn-custom btn-finalizar">Finalizar Compra</a>
    </div>
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
</html>
