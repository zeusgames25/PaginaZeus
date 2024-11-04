<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil Administrador - Gestión de Productos</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Estilos personalizados */
        .sidebar { min-height: 100vh; background-color: #343a40; color: #fff; }
        .sidebar h4 { color: #ffc107; }
        .nav-link { color: #adb5bd; font-weight: 500; }
        .nav-link:hover, .nav-link.active { color: #ffc107; background-color: #495057; }
        .table-custom th { background-color: #343a40; color: #fff; }
        .table-custom tbody tr:hover { background-color: #f8f9fa; }
        .btn-primary, .btn-warning, .btn-danger { border-radius: 20px; padding: 5px 15px; }
        .nav-divider {
            height: 1px;
            background-color: #6c757d;
            margin: 10px 0;
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
                <a class="nav-link active" href="listarproductos.jsp">
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
                <a class="nav-link" href="sugerencias.jsp">
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
                <h2 class="my-4 text-center text-primary">Listado de Productos</h2>
                <div class="d-flex justify-content-end">
                    <!-- Botón para abrir el modal de registro -->
                    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#registerProductModal">
                        <i class="fas fa-plus-circle"></i> Registrar Nuevo Producto
                    </button>
                </div>

                <!-- Modal para registrar producto -->
                <div class="modal fade" id="registerProductModal" tabindex="-1" aria-labelledby="registerProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="registerProductModalLabel">Registrar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="RegistrarProductosServlet" method="post">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="descripcion" class="form-label">Descripción</label>
                                        <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="precio" class="form-label">Precio</label>
                                        <input type="number" class="form-control" id="precio" name="precio" step="0.01" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="stock" class="form-label">Stock</label>
                                        <input type="number" class="form-control" id="stock" name="stock" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="imagen" class="form-label">URL de la Imagen</label>
                                        <input type="text" class="form-control" id="imagen" name="imagen" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Registrar Producto</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Productos -->
                <table class="table table-hover table-custom shadow-sm rounded">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Descripción</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Stock</th>
                            <th scope="col">Imagen</th>
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
                            String query = "SELECT * FROM producto";
                            rs = stmt.executeQuery(query);

                            while (rs.next()) {
                                String idproducto = rs.getString("idproducto");
                                String nombre = rs.getString("nombre");
                                String descripcion = rs.getString("descripcion");
                                float precio = rs.getFloat("precio");
                                int stock = rs.getInt("stock");
                                String imagen = rs.getString("imagen");
                        %>

                        <tr>
                            <td><%=idproducto%></td>
                            <td><%=nombre%></td>
                            <td><%=descripcion%></td>
                            <td>S/ <%=precio%></td>
                            <td><%=stock%></td>
                            <td><img src="<%=imagen%>" alt="<%=nombre%>" class="img-thumbnail" style="height: 50px; width: auto;"></td>
                            <td class="text-center">
                                <!-- Botón para abrir el modal de edición -->
                                <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editModal<%=idproducto%>">
                                    <i class="fas fa-edit"></i> Editar
                                </button>
                                <!-- Formulario para Eliminar -->
                                <form action="EliminarDatosServlet" method="post" style="display: inline;">
                                    <input type="hidden" name="idproducto" value="<%=idproducto%>">
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>

                        <!-- Modal para editar producto -->
                        <div class="modal fade" id="editModal<%=idproducto%>" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel">Editar Producto</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="EditarProductoServlet" method="post">
                                            <input type="hidden" name="idproducto" value="<%=idproducto%>">
                                            <div class="mb-3">
                                                <label for="nombre<%=idproducto%>" class="form-label">Nombre</label>
                                                <input type="text" class="form-control" id="nombre<%=idproducto%>" name="nombre" value="<%=nombre%>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="descripcion<%=idproducto%>" class="form-label">Descripción</label>
                                                <textarea class="form-control" id="descripcion<%=idproducto%>" name="descripcion" rows="3" required><%=descripcion%></textarea>
                                            </div>
                                            <div class="mb-3">
                                                <label for="precio<%=idproducto%>" class="form-label">Precio</label>
                                                <input type="number" class="form-control" id="precio<%=idproducto%>" name="precio" step="0.01" value="<%=precio%>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="stock<%=idproducto%>" class="form-label">Stock</label>
                                                <input type="number" class="form-control" id="stock<%=idproducto%>" name="stock" value="<%=stock%>" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="imagen<%=idproducto%>" class="form-label">URL de la Imagen</label>
                                                <input type="text" class="form-control" id="imagen<%=idproducto%>" name="imagen" value="<%=imagen%>" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary w-100">
                                                <i class="fas fa-save"></i> Actualizar Producto
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        %>
                    </tbody>
                </table>
            </main>
        </div>
    </div>
</body>
</html>
