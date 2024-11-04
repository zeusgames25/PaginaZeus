package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Servlet implementation class CarritoServlet
 */
public class CarritoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarritoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String nombre = request.getParameter("productoNombre");
	        float precio = Float.parseFloat(request.getParameter("productoPrecio"));
	        String imagen = request.getParameter("productoImagen");
	        int productoId = Integer.parseInt(request.getParameter("productoId"));

	        // Obtener la sesión del usuario
	        HttpSession session = request.getSession();
	        ArrayList<HashMap<String, Object>> carrito;

	        // Si el carrito no existe, crear uno nuevo
	        if (session.getAttribute("carrito") == null) {
	            carrito = new ArrayList<>();
	            session.setAttribute("carrito", carrito);
	        } else {
	            carrito = (ArrayList<HashMap<String, Object>>) session.getAttribute("carrito");
	        }

	        // Crear un nuevo producto como un mapa
	        HashMap<String, Object> producto = new HashMap<>();
	        producto.put("id", productoId);
	        producto.put("nombre", nombre);
	        producto.put("precio", precio);
	        producto.put("imagen", imagen);

	        // Agregar el producto al carrito
	        carrito.add(producto);

	        // Redirigir de vuelta al catálogo
	        response.sendRedirect("catalogo.jsp");
	    }
	}