package curso.java.tienda.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import curso.java.tienda.model.DAO.DetallePedidoDAO;
import curso.java.tienda.model.DAO.PedidoDAO;
import curso.java.tienda.model.DAO.ProductoDAO;
import curso.java.tienda.model.VO.DetallePedidoVO;
import curso.java.tienda.model.VO.PedidoVO;
import curso.java.tienda.model.VO.ProductoVO;
import curso.java.tienda.model.VO.UsuarioVO;
import curso.java.tienda.service.OperacionesUsuario;

/**
 * Servlet implementation class GestionarPagoServlet
 */
@WebServlet("/GestionarPagoServlet")
public class GestionarPagoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GestionarPagoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session.getAttribute("usuario") != null) {
			request.getRequestDispatcher("view/pago.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("view/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		HashMap<ProductoVO, Integer> carrito = (HashMap<ProductoVO, Integer>) session.getAttribute("carrito");

		
		double total = 0;

				
		
		
		UsuarioVO u = (UsuarioVO) session.getAttribute("usuario");
		
		OperacionesUsuario.agregarDatosEnvio(request.getParameter("nombre"), request.getParameter("apellido1"), request.getParameter("apellido2"), 
				request.getParameter("direccion"), request.getParameter("dni"), request.getParameter("localidad"), request.getParameter("provincia"),
				request.getParameter("telefono"), u.getEmail());
		
		UsuarioVO usuarioCompleto = OperacionesUsuario.recuperarUsuario(u.getEmail());
		session.setAttribute("usuario", usuarioCompleto);
		
		Date dt = new Date();
		
		if (carrito.size() > 0) {

			for (HashMap.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
				ProductoVO producto = entry.getKey();
				int cantidad = entry.getValue();
				int stock = ProductoDAO.comprobarStock(producto.getId());
				if (stock != -1) {
					if (stock < cantidad) {
						// REDIRIGIR A LA VISTA E INDICAR QUE PRODUCTO SE A QUEDADO SIN STOCK
						request.getRequestDispatcher("CarritoServlet").forward(request, response);
						return; // COMPROBAR O SUSTITUIR POR BOOLEANO
						// NO REDIRIGE BIEN
					}
				}
				
				total += ((producto.getPrecio()*producto.getImpuesto())+producto.getPrecio())*cantidad;
			}
		
		
			
			
			
			PedidoVO pedido = new PedidoVO(usuarioCompleto.getId(), request.getParameter("metodoPago"), null, total);
			PedidoDAO.realizarPedido(pedido);
			PedidoVO pedidoInsertado = PedidoDAO.buscarUltimoPedidoPorUsuario(usuarioCompleto.getId());

		
			List<DetallePedidoVO> detalles = new ArrayList<>();

			for (HashMap.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
				ProductoVO producto = entry.getKey();
				int cantidad = entry.getValue();
				double totalMasImpuesto = ((producto.getPrecio()*producto.getImpuesto())+producto.getPrecio())*cantidad;
				DetallePedidoVO detalle = new DetallePedidoVO(pedidoInsertado.getId(), producto.getId(), producto.getPrecio(), cantidad, producto.getImpuesto(), totalMasImpuesto);
				detalles.add(detalle);
			}
			DetallePedidoDAO.rellenarDetallePedido(detalles);
			
			// ACTUALIZO LA TABLA DE PRODUCTOS CON EL NUEVO STOCK DESPUES DE LA VENTA
			for (HashMap.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
				ProductoVO producto = entry.getKey();
				int cantidad = entry.getValue(); 
				
				ProductoDAO.actualizarStock(producto.getId(), cantidad);
			}
			
			session.setAttribute("carrito", null);
			request.getRequestDispatcher("").forward(request, response);
		} else {
			// REDIRIGIR E INDICAR QUE EL CARRITO ESTA VACIO
			request.getRequestDispatcher("view/carrito.jsp").forward(request, response);
		}

		
		

	}

}
