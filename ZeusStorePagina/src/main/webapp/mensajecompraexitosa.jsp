<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Compra Realizada con Éxito</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.9.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>
<div class="container mt-5">
    <div class="alert alert-success text-center" role="alert">
        <h1>¡Compra Realizada con Éxito!</h1>
        <p>Su compra ha sido procesada correctamente. Agradecemos su preferencia.</p>
        <hr>
        <p>Detalles de la compra:</p>
        <ul>
            <li>Producto: <strong>${param.producto}</strong></li>
            <li>Precio: <strong>${param.precio}</strong></li>
            <li>Cantidad: <strong>${param.cantidad}</strong></li>
            <li>Dirección de envío: <strong>${sessionScope.direccion}</strong></li>
        </ul>
        <a href="indexusuario.jsp" class="btn btn-primary">Volver al inicio</a>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
