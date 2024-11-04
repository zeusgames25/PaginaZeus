<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil Administrador - Sugerencias de Usuarios</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Estilos personalizados para el panel de administración */
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: #fff;
        }
        .sidebar h4 {
            color: #ffc107;
        }
        .nav-link {
            color: #adb5bd;
            font-weight: 500;
        }
        .nav-link:hover, .nav-link.active {
            color: #ffc107;
            background-color: #495057;
        }
        .nav-divider {
            height: 1px;
            background-color: #6c757d;
            margin: 10px 0;
        }
        .table-custom th {
            background-color: #343a40;
            color: #fff;
        }
        .table-custom tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-danger {
            border-radius: 20px;
            padding: 5px 15px;
        }
    </style>
</head>
<body>

    <!-- Encabezado con imagen -->
    <div style="background-color: #000000;">
        <div class="text-center py-3">
            <img src="https://i.postimg.cc/kGL7j8sy/portada-fb-final-gytgvg.png" class="img-fluid img-rounded" alt="Logo" width="900" height="250">
        </div>
        <hr class="m-0" style="border-top: 3px solid #ffffff;">
    </div>

    <div class="container-fluid">
        <div class="row">
                       <!-- Sidebar de navegación -->
<nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="position-sticky">
        <h4 class="text-center mt-4 mb-3">Panel de Administración</h4>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="listarproductos.jsp">
                    <i class="fas fa-box-open"></i> Productos
                </a>
            </li>
            <div class="nav-divider"></div>
            <li class="nav-item">
                <a class="nav-link" href="mostrarusuarios.jsp">
                    <i class="fas fa-users"></i> Usuarios
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="pedidos.jsp">
                    <i class="fas fa-shopping-cart"></i> Pedidos
                </a>
            </li>
            <div class="nav-divider"></div>
            <li class="nav-item">
                <a class="nav-link" href="estadisticasProductos.jsp">
                    <i class="fas fa-chart-bar"></i> Estadísticas de Productos
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="sugerencias.jsp">
                    <i class="fas fa-lightbulb"></i> Sugerencias de Usuarios
                </a>
            </li>
            <div class="nav-divider"></div>
            <!-- Nueva opción de Cerrar Sesión -->
            <li class="nav-item">
                <a class="nav-link" href="CerrarSesion">
                    <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                </a>
            </li>
        </ul>
    </div>
</nav>

            <!-- Contenido principal -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h2 class="my-4 text-center text-primary">Listado de Sugerencias de Usuarios</h2>

                <!-- Tabla de Sugerencias -->
                <table class="table table-hover table-custom shadow-sm rounded">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Correo</th>
                            <th scope="col">Sugerencia</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String url = "jdbc:mysql://localhost:3306/zeusstore";
                        String user = "root";
                        String password = "123456";
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(url, user, password);
                            stmt = conn.createStatement();

                            // Consulta SQL con JOIN entre sugerencias y cliente
                            String query = "SELECT s.idsugerencias, c.nombreusuario, c.correo, s.mensaje " +
                                           "FROM sugerencias s " +
                                           "JOIN cliente c ON s.idcliente = c.idcliente";
                            rs = stmt.executeQuery(query);

                            while (rs.next()) {
                                String idsugerencias = rs.getString("idsugerencias");
                                String nombreusuario = rs.getString("nombreusuario");
                                String correo = rs.getString("correo");
                                String mensaje = rs.getString("mensaje");
                        %>

                        <tr>
                            <td><%=idsugerencias%></td>
                            <td><%=nombreusuario%></td>
                            <td><%=correo%></td>
                            <td><%=mensaje%></td>
                            <td class="text-center">
                                <!-- Formulario para Eliminar -->
                                <form action="EliminarSugerenciaServlet" method="post" style="display: inline;">
                                    <input type="hidden" name="idsugerencias" value="<%=idsugerencias%>">
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>

                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        %>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
</body>
</html> 
