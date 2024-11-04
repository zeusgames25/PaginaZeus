<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mensaje Enviado</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
  
  <style>
    .success-message {
      margin-top: 50px;
      padding: 40px;
      border: 2px solid #28a745;
      border-radius: 10px;
      background-color: #e6ffe6;
    }
    .success-icon {
      font-size: 4rem;
      color: #28a745;
    }
    .back-button {
      background-color: #28a745;
      border-color: #28a745;
      margin-top: 20px;
    }
    .back-button:hover {
      background-color: #218838;
      border-color: #1e7e34;
    }
  </style>
</head>
<body>
  
  <div class="container text-center">
    <div class="success-message">
      <i class="bi bi-check-circle success-icon"></i>
      <h1 class="mt-4">¡Mensaje enviado con éxito!</h1>
      <p class="lead">Gracias por ponerte en contacto con nosotros. Te responderemos lo antes posible.</p>
      <a href="index.jsp" class="btn btn-success back-button">Volver al inicio</a>
    </div>
  </div>

</body>
</html>
